# file containing methods for requesting forecast simulations from GEOGloWS
"""
    forecast_stats(parameters::AbstractDict{Symbol,<:Any})

returns statistics calculated from 51 forecast ensemble members.
"""
function forecast_stats(parameters::AbstractDict{Symbol,<:Any})
    endpoint = "ForecastStats"

    r = _make_request(baseurl, endpoint, parameters)

    _read_response(r, parameters[:return_format], with_dates = true)
end

"""
    forecast_stats(reach_id::Int; return_format::Symbol = :csv)

returns statistics calculated from 51 forecast ensemble members.
"""
function forecast_stats(reach_id::Int; return_format::Symbol = :csv)
    parameters = Dict(:reach_id => reach_id, :return_format => return_format)

    forecast_stats(parameters)
end

"""
    forecast_stats(reach_id::Int,date::AbstractString; return_format::Symbol = :csv)

returns statistics calculated from 51 forecast ensemble members.
"""
function forecast_stats(
    reach_id::Int,
    date::AbstractString;
    return_format::Symbol = :csv,
)
    parameters = Dict(
        :reach_id => reach_id,
        :date => date,
        :return_format => return_format,
    )

    forecast_stats(parameters)
end

"""
    forecast_stats(reach_id::Int,date::TimeType; return_format::Symbol = :csv)

returns statistics calculated from 51 forecast ensemble members.
"""
function forecast_stats(
    reach_id::Int,
    date::TimeType;
    return_format::Symbol = :csv,
)
    datestr = try
        Dates.format(date, "YYYY-m-d")
    catch
        Dates.format(date, "yyyymmdd")
    end

    parameters = Dict(
        :reach_id => reach_id,
        :date => datestr,
        :return_format => return_format,
    )

    forecast_stats(parameters)
end

"""
    forecast_stats(lat::Real, lon::Real; return_format::Symbol = :csv)

returns statistics calculated from 51 forecast ensemble members.
"""
function forecast_stats(lat::Real, lon::Real; return_format::Symbol = :csv)
    parameters = Dict(:lat => lat, :lon => lon, :return_format => return_format)

    forecast_stats(parameters)
end

"""
    forecast_stats(lat::Real, lon::Real, date::AbstractString; return_format::Symbol = :csv)

returns statistics calculated from 51 forecast ensemble members.
"""
function forecast_stats(
    lat::Real,
    lon::Real,
    date::AbstractString;
    return_format::Symbol = :csv,
)
    if occursin("-", date)
        date = replace(date, "-" => "")
    end

    parameters = Dict(
        :lat => lat,
        :lon => lon,
        :date => date,
        :return_format => return_format,
    )

    forecast_stats(parameters)
end

"""
    forecast_stats(lat::Real, lon::Real, date::TimeType; return_format::Symbol = :csv)

returns statistics calculated from 51 forecast ensemble members.
"""
function forecast_stats(
    lat::Real,
    lon::Real,
    date::TimeType;
    return_format::Symbol = :csv,
)
    datestr = Dates.format(date, "yyyymmdd")

    parameters = Dict(
        :lat => lat,
        :lon => lon,
        :date => datestr,
        :return_format => return_format,
    )

    forecast_stats(parameters)
end

"""
    forecast_ensembles(parameters::AbstractDict{Symbol,<:Any})

returns a timeseries for each of the 51 normal forecast ensemble members and the 52nd higher resolution forecast
"""
function forecast_ensembles(parameters::AbstractDict{Symbol,<:Any})
    endpoint = "ForecastEnsembles"

    r = _make_request(baseurl, endpoint, parameters)

    _read_response(r, parameters[:return_format], with_dates = true)
end

"""
    forecast_ensembles(reach_id::Int; return_format::Symbol = :csv)

returns a timeseries for each of the 51 normal forecast ensemble members and the 52nd higher resolution forecast
"""
function forecast_ensembles(reach_id::Int; return_format::Symbol = :csv)
    parameters = Dict(:reach_id => reach_id, :return_format => return_format)

    forecast_ensembles(parameters)
end

"""
    forecast_ensembles(reach_id::Int, date::AbstractString; return_format::Symbol = :csv)

returns a timeseries for each of the 51 normal forecast ensemble members and the 52nd higher resolution forecast
"""
function forecast_ensembles(
    reach_id::Int,
    date::AbstractString;
    return_format::Symbol = :csv,
)
    if occursin("-", date)
        date = replace(date, "-" => "")
    end

    parameters = Dict(
        :reach_id => reach_id,
        :date => date,
        :return_format => return_format,
    )

    forecast_ensembles(parameters)
end

"""
    forecast_ensembles(reach_id::Int, date::TimeType; return_format::Symbol = :csv)

returns a timeseries for each of the 51 normal forecast ensemble members and the 52nd higher resolution forecast
"""
function forecast_ensembles(
    reach_id::Int,
    date::TimeType;
    return_format::Symbol = :csv,
)
    datestr = Dates.format(date, "yyyymmdd")

    parameters = Dict(
        :reach_id => reach_id,
        :date => datestr,
        :return_format => return_format,
    )

    forecast_ensembles(parameters)
end

"""
    forecast_ensembles(lat::Real, lon::Real; return_format::Symbol = :csv)

returns a timeseries for each of the 51 normal forecast ensemble members and the 52nd higher resolution forecast
"""
function forecast_ensembles(lat::Real, lon::Real; return_format::Symbol = :csv)
    parameters = Dict(:lat => lat, :lon => lon, :return_format => return_format)

    forecast_ensembles(parameters)
end

"""
    forecast_ensembles(lat::Real, lon::Real, date::AbstractString; return_format::Symbol = :csv)

returns a timeseries for each of the 51 normal forecast ensemble members and the 52nd higher resolution forecast
"""
function forecast_ensembles(
    lat::Real,
    lon::Real,
    date::AbstractString;
    return_format::Symbol = :csv,
)
    if occursin("-", date)
        date = replace(date, "-" => "")
    end

    parameters = Dict(
        :lat => lat,
        :lon => lon,
        :date => date,
        :return_format => return_format,
    )

    forecast_ensembles(parameters)
end

"""
    forecast_ensembles(lat::Real, lon::Real, date::TimeType; return_format::Symbol = :csv)

returns a timeseries for each of the 51 normal forecast ensemble members and the 52nd higher resolution forecast
"""
function forecast_ensembles(
    lat::Real,
    lon::Real,
    date::TimeType;
    return_format::Symbol = :csv,
)
    datestr = Dates.format(date, "yyyymmdd")

    parameters = Dict(
        :lat => lat,
        :lon => lon,
        :date => datestr,
        :return_format => return_format,
    )

    forecast_ensembles(parameters)
end

"""
    forecast_records(parameters::AbstractDict{Symbol,<:Any})

retrieves the rolling record of the mean of the forecasted streamflow during the
first 24 hours of each day's forecast. That is, each day day after the streamflow
forecasts are computed, the average of first 8 of the 3-hour timesteps are recorded to a csv.
"""
function forecast_records(parameters::AbstractDict{Symbol,<:Any})
    endpoint = "ForecastRecords"

    r = _make_request(baseurl, endpoint, parameters)

    _read_response(r, parameters[:return_format], with_dates = true)
end

"""
    forecast_records(reach_id::Int; return_format::Symbol = :csv)

retrieves the rolling record of the mean of the forecasted streamflow during the
first 24 hours of each day's forecast. That is, each day day after the streamflow
forecasts are computed, the average of first 8 of the 3-hour timesteps are recorded to a csv.
"""
function forecast_records(reach_id::Int; return_format::Symbol = :csv)
    parameters = Dict(:reach_id => reach_id, :return_format => return_format)

    forecast_records(parameters)
end

"""
    forecast_records(lat::Real, lon::Real; return_format::Symbol = :csv)

retrieves the rolling record of the mean of the forecasted streamflow during the
first 24 hours of each day's forecast. That is, each day day after the streamflow
forecasts are computed, the average of first 8 of the 3-hour timesteps are recorded to a csv.
"""
function forecast_records(lat::Real, lon::Real; return_format::Symbol = :csv)
    parameters = Dict(:lat => lat, :lon => lon, :return_format => return_format)

    forecast_records(parameters)
end

"""
    forecast_records(reach_id::Int, start_date::TimeType, end_date::TimeType; return_format::Symbol = :csv,)

retrieves the rolling record of the mean of the forecasted streamflow during the
first 24 hours of each day's forecast. That is, each day day after the streamflow
forecasts are computed, the average of first 8 of the 3-hour timesteps are recorded to a csv.
"""
function forecast_records(
    reach_id::Int,
    start_date::TimeType,
    end_date::TimeType;
    return_format::Symbol = :csv,
)
    start_datestr = Dates.format(start_date, "yyyymmdd")
    end_datestr = Dates.format(end_date, "yyyymmdd")

    parameters = Dict(
        :reach_id => reach_id,
        :start_date => start_datestr,
        :end_date => end_datestr,
        :return_format => return_format,
    )

    forecast_records(parameters)
end

"""
    forecast_records(reach_id::Int, start_date::AbstractString, end_date::AbstractString; return_format::Symbol = :csv,)

retrieves the rolling record of the mean of the forecasted streamflow during the
first 24 hours of each day's forecast. That is, each day day after the streamflow
forecasts are computed, the average of first 8 of the 3-hour timesteps are recorded to a csv.
"""
function forecast_records(
    reach_id::Int,
    start_date::AbstractString,
    end_date::AbstractString;
    return_format::Symbol = :csv,
)
    if occursin("-", start_date)
        start_date = replace(start_date, "-" => "")
    end
    if occursin("-", end_date)
        end_date = replace(end_date, "-" => "")
    end

    parameters = Dict(
        :reach_id => reach_id,
        :start_date => start_date,
        :end_date => end_date,
        :return_format => return_format,
    )

    forecast_records(parameters)
end

"""
    forecast_records(lat::Real, lon::Real, start_date::TimeType, end_date::TimeType; return_format::Symbol = :csv,)

retrieves the rolling record of the mean of the forecasted streamflow during the
first 24 hours of each day's forecast. That is, each day day after the streamflow
forecasts are computed, the average of first 8 of the 3-hour timesteps are recorded to a csv.
"""
function forecast_records(
    lat::Real,
    lon::Real,
    start_date::TimeType,
    end_date::TimeType;
    return_format::Symbol = :csv,
)
    start_datestr = Dates.format(start_date, "yyyymmdd")
    end_datestr = Dates.format(end_date, "yyyymmdd")

    parameters = Dict(
        :lat => lat,
        :lon => lon,
        :start_date => start_datestr,
        :end_date => end_datestr,
        :return_format => return_format,
    )

    forecast_records(parameters)
end

"""
    forecast_records(lat::Real, lon::Real, start_date::AbstractString, end_date::AbstractString; return_format::Symbol = :csv,)

retrieves the rolling record of the mean of the forecasted streamflow during the
first 24 hours of each day's forecast. That is, each day day after the streamflow
forecasts are computed, the average of first 8 of the 3-hour timesteps are recorded to a csv.
"""
function forecast_records(
    lat::Real,
    lon::Real,
    start_date::AbstractString,
    end_date::AbstractString;
    return_format::Symbol = :csv,
)
    if occursin("-", start_date)
        start_date = replace(start_date, "-" => "")
    end
    if occursin("-", end_date)
        end_date = replace(end_date, "-" => "")
    end

    parameters = Dict(
        :lat => lat,
        :lon => lon,
        :start_date => start_date,
        :end_date => end_date,
        :return_format => return_format,
    )

    forecast_records(parameters)
end

"""
    forecast_warnings(parameters::AbstractDict{Symbol,<:Any})

returns a csv created to summarize the potential return period level flow events
coming to the reaches in a specified region. The CSV contains a column for the
reach_id, lat of the reach, lon of the reach, maximum forecasted flow in the next
15 day forecast, and a column for each of the return periods (2, 10, 20, 25, 50, 100)
which will contain the date when the forecast is first expected to pass that threshold
"""
function forecast_warnings(parameters::AbstractDict{Symbol,<:Any})
    endpoint = "ForecastWarnings"

    r = _make_request(baseurl, endpoint, parameters)

    _read_response(r, parameters[:return_format])
end

"""
    forecast_warnings(; return_format::Symbol = :csv)

returns a csv created to summarize the potential return period level flow events
coming to the reaches in a specified region. The CSV contains a column for the
reach_id, lat of the reach, lon of the reach, maximum forecasted flow in the next
15 day forecast, and a column for each of the return periods (2, 10, 20, 25, 50, 100)
which will contain the date when the forecast is first expected to pass that threshold
"""
function forecast_warnings(; return_format::Symbol = :csv)
    parameters = Dict(:return_format => return_format)

    forecast_warnings(parameters)
end

"""
    forecast_warnings(date::TimeType; return_format::Symbol = :csv)

returns a csv created to summarize the potential return period level flow events
coming to the reaches in a specified region. The CSV contains a column for the
reach_id, lat of the reach, lon of the reach, maximum forecasted flow in the next
15 day forecast, and a column for each of the return periods (2, 10, 20, 25, 50, 100)
which will contain the date when the forecast is first expected to pass that threshold
"""
function forecast_warnings(date::TimeType; return_format::Symbol = :csv)
    datestr = Dates.format(date, "yyyymmdd")

    parameters = Dict(:date => datestr, :return_format => return_format)

    forecast_warnings(parameters)
end

"""
    forecast_warnings(region::AbstractString; return_format::Symbol = :csv)

returns a csv created to summarize the potential return period level flow events
coming to the reaches in a specified region. The CSV contains a column for the
reach_id, lat of the reach, lon of the reach, maximum forecasted flow in the next
15 day forecast, and a column for each of the return periods (2, 10, 20, 25, 50, 100)
which will contain the date when the forecast is first expected to pass that threshold
"""
function forecast_warnings(region::AbstractString; return_format::Symbol = :csv)
    parameters = Dict(:region => region, :return_format => return_format)

    forecast_warnings(parameters)
end

"""
    forecast_warnings(region::AbstractString, date::TimeType; return_format::Symbol = :csv)

returns a csv created to summarize the potential return period level flow events
coming to the reaches in a specified region. The CSV contains a column for the
reach_id, lat of the reach, lon of the reach, maximum forecasted flow in the next
15 day forecast, and a column for each of the return periods (2, 10, 20, 25, 50, 100)
which will contain the date when the forecast is first expected to pass that threshold
"""
function forecast_warnings(
    region::AbstractString,
    date::TimeType;
    return_format::Symbol = :csv,
)
    datestr = Dates.format(date, "yyyymmdd")

    parameters = Dict(
        :region => region,
        :date => datestr,
        :return_format => return_format,
    )

    forecast_warnings(parameters)
end

"""
    forecast_warnings(region::AbstractString, date::AbstractString; return_format::Symbol = :csv)

returns a csv created to summarize the potential return period level flow events
coming to the reaches in a specified region. The CSV contains a column for the
reach_id, lat of the reach, lon of the reach, maximum forecasted flow in the next
15 day forecast, and a column for each of the return periods (2, 10, 20, 25, 50, 100)
which will contain the date when the forecast is first expected to pass that threshold
"""
function forecast_warnings(
    region::AbstractString,
    date::AbstractString;
    return_format::Symbol = :csv,
)
    if occursin("-", date)
        date = replace(date, "-" => "")
    end

    parameters = Dict(
        region::AbstractString,
        :date => date,
        :return_format => return_format,
    )

    forecast_warnings(parameters)
end
