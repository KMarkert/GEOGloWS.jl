# file containing methods for requesting historical simulations from GEOGloWS

"""
    historic_simulation(parameters::AbstractDict{Symbol,<:Any})

returns simulated streamflow data based on the ERA-5 dataset. A successful
response will return a time series with date-value pairs.
"""
function historic_simulation(parameters::AbstractDict{Symbol,<:Any})
    endpoint = "HistoricSimulation"

    r = _make_request(baseurl, endpoint, parameters)

    _read_response(r, parameters[:return_format]; with_dates = true)

end

"""
    historic_simulation(reach_id::Int; return_format::Symbol = :csv)

returns simulated streamflow data based on the ERA-5 dataset. A successful
response will return a time series with date-value pairs.
"""
function historic_simulation(reach_id::Int; return_format::Symbol = :csv)

    parameters = Dict(:reach_id => reachid, :return_format => return_format)

    historic_simulation(parameters)
end

"""
    historic_simulation(lat::Real, lon::Real; return_format::Symbol = :csv)

returns simulated streamflow data based on the ERA-5 dataset. A successful
response will return a time series with date-value pairs.
"""
function historic_simulation(lat::Real, lon::Real; return_format::Symbol = :csv)

    parameters = Dict(:lat => lat, :lon => lon, :return_format => return_format)

    historic_simulation(parameters)
end

"""
    return_periods(parameters::AbstractDict{Symbol,<:Any})

returns the 2, 5, 10, 25, 50, and 100 year return period based on the 40-years
simulated streamflow data and using the Gumbel Method. A successful response
will return key-value pairs for earch return period along with metadata.
"""
function return_periods(parameters::AbstractDict{Symbol,<:Any})

    endpoint = "ReturnPeriods"

    r = _make_request(baseurl, endpoint, parameters)

    _read_response(r, parameters[:return_format])

    return result

end

"""
    return_periods(reach_id::Int; return_format::Symbol = :csv, forcing::Symbol = :era_5,)

returns the 2, 5, 10, 25, 50, and 100 year return period based on the 40-years
simulated streamflow data and using the Gumbel Method. A successful response
will return key-value pairs for earch return period along with metadata.
"""
function return_periods(
    reach_id::Int;
    return_format::Symbol = :csv,
    forcing::Symbol = :era_5,
)
    parameters = Dict(
        :reach_id => reach_id,
        :return_format => return_format,
        :forcing => forcing,
    )

    return_periods(parameters)
end

"""
    return_periods(lat::Real, lon::Real; return_format::Symbol = :csv, forcing::Symbol = :era_5,)

returns the 2, 5, 10, 25, 50, and 100 year return period based on the 40-years
simulated streamflow data and using the Gumbel Method. A successful response
will return key-value pairs for earch return period along with metadata.
"""
function return_periods(
    lat::Real,
    lon::Real;
    return_format::Symbol = :csv,
    forcing::Symbol = :era_5,
)
    parameters = Dict(
        :lat => lat,
        :lon => lon,
        :return_format => return_format,
        :forcing => forcing,
    )

    return_periods(parameters)
end

"""
    daily_averages(parameters::AbstractDict{Symbol,<:Any})

returns the average flow for each day of the year for the Historic Simulation
"""
function daily_averages(parameters::AbstractDict{Symbol,<:Any})
    endpoint = "DailyAverages"

    r = _make_request(baseurl, endpoint, parameters)

    _read_response(r, parameters[:return_format])

end

"""
    daily_averages(reach_id::Int; return_format::Symbol = :csv)

returns the average flow for each day of the year for the Historic Simulation
"""
function daily_averages(reach_id::Int; return_format::Symbol = :csv)
    parameters = Dict(:reach_id => reach_id, :return_format => return_format)

    daily_averages(parameters)
end

"""
    daily_averages(lat::Real, lon::Real; return_format::Symbol = :csv)

returns the average flow for each day of the year for the Historic Simulation
"""
function daily_averages(lat::Real, lon::Real; return_format::Symbol = :csv)
    parameters = Dict(:lat => lat, :lon => lon, :return_format => return_format)

    daily_averages(parameters)
end

"""
    monthly_averages(parameters::AbstractDict{Symbol,<:Any})

returns the average flow for each month of the year for the Historic Simulation
"""
function monthly_averages(parameters::AbstractDict{Symbol,<:Any})
    endpoint = "MonthlyAverages"

    r = _make_request(baseurl, endpoint, parameters)

    _read_response(r, parameters[:return_format])

end

"""
    monthly_averages(reach_id::Int; return_format::Symbol = :csv)

returns the average flow for each month of the year for the Historic Simulation
"""
function monthly_averages(reach_id::Int; return_format::Symbol = :csv)
    parameters = Dict(:reach_id => reach_id, :return_format => return_format)

    monthly_averages(parameters)
end

"""
    monthly_averages(lat::Real, lon::Real; return_format::Symbol = :csv)

returns the average flow for each month of the year for the Historic Simulation
"""
function monthly_averages(lat::Real, lon::Real; return_format::Symbol = :csv)
    parameters = Dict(:lat => lat, :lon => lon, :return_format => return_format)

    monthly_averages(parameters)
end
