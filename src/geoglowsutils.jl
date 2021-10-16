# file containing methods for requesting ancillary information relating to simulations from GEOGloWS

"""
    available_data()

returns the regions available and their corresponding available dates.
See also `available_regions()` and `available_dates()`
"""
function available_data()
    endpoint = "AvailableData"

    r = _make_request(baseurl,endpoint)

    JSON3.read(r.body,Dict)
end

"""
    available_regions()

returns returns the available regions.
"""
function available_regions()
    endpoint = "AvailableRegions"

    r = _make_request(baseurl,endpoint)

    JSON3.read(r.body,Dict)
end

"""
    available_dates(region::AbstractString)

returns the available forecast dates.
"""
function available_dates(region::AbstractString)
    endpoint = "AvailableDates"

    r = _make_request(baseurl,endpoint,Dict(:region => region))

    JSON3.read(r.body,Dict)
end
