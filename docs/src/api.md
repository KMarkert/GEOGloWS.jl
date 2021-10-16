# GEOGloWS.jl API

The `GEOGloWS.jl` API sends requests to the [GEOGloWS ECMWF Streamflow service](https://geoglows.ecmwf.int/) and formats the returned data into Julia Types. For more in depth documentation on specific methods that this package interfaces with, see the official [GEOGloWS Documention](https://geoglows.ecmwf.int/documentation).

## Model run data
```@docs
GEOGloWS.available_data
```

```@docs
GEOGloWS.available_regions
```

```@docs
GEOGloWS.available_dates
```

## Forecast data
```@docs
GEOGloWS.forecast_stats
```

```@docs
GEOGloWS.forecast_ensembles
```

```@docs
GEOGloWS.forecast_records
```

```@docs
GEOGloWS.forecast_warnings
```

## Historic data
```@docs
GEOGloWS.historic_simulation
```

```@docs
GEOGloWS.return_periods
```

```@docs
GEOGloWS.daily_averages
```

```@docs
GEOGloWS.monthly_averages
```
