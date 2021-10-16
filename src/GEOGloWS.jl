__precompile__()

module GEOGloWS

using CSV
using HTTP
using Retry
using Dates
using JSON3
using Logging
using TimeZones
using DataFrames


const baseurl = "https://geoglows.ecmwf.int/api"

"""
    _make_response(url::AbstractString, endpoint::AbstractString, parameters::AbstractDict{Symbol,<:Any})

Private function for submitting get request to particular endpoint with parameters
"""
function _make_request(
    url::AbstractString,
    endpoint::AbstractString,
    parameters::AbstractDict{Symbol,<:Any},
)

    parameterstring = "?"

    # convert dict to string of key=value
    for (key, value) in parameters
        x = "$(string(key))=$(string(value))&"
        parameterstring *= x
    end

    # cutoff the trailing '&' from the last addition of parameter
    parameterstring = parameterstring[1:end-1]

    # create a url to get data
    requesturl = joinpath(baseurl, endpoint, parameterstring)

    # send request
    _make_request(requesturl)
end

"""
    _make_response(url::AbstractString, endpoint::AbstractString)

Private function for submitting get request to particular endpoint
"""
function _make_request(url::AbstractString, endpoint::AbstractString)

    # create a url to get data
    requesturl = joinpath(baseurl, endpoint)

    # send request
    _make_request(requesturl)
end

"""
    _make_response(requesturl::AbstractString)

Private function for submitting get request with retries and exponential backoff
"""
function _make_request(requesturl::AbstractString)

    @debug "making request to $requesturl"

    # use exponential backoff with 4 retries
    @repeat 4 try
        response = HTTP.get(requesturl)

    catch e
        @delay_retry if e.status < 200 && e.status >= 500
        end
    end
end

"""
    _read_response(r::HTTP.Messages.Response, fmt::Symbol; with_dates::Bool = false)

Private function for taking api response and reading to proper format
"""
function _read_response(
    r::HTTP.Messages.Response,
    fmt::Symbol;
    with_dates::Bool = false,
)
    if fmt == :csv
        result = CSV.read(r.body, DataFrame)

        if with_dates
            result[!, :datetime] =
                DateTime.(result[!, :datetime], DateFormat("Y-m-dTHH:MM:SSz"))
        end

    elseif fmt == :json
        result = JSON3.read(r.body, Dict)
    else
        @error "could not determine return format, please choose either ':csv' or ':json'"
    end

    return result
end

include("geoglowsutils.jl")
include("forecaststreamflow.jl")
include("historicalstreamflow.jl")


end # module
