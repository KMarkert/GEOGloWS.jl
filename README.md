# GEOGloWS.jl
Julia package to request data from the [GEOGloWS ECMWF Streamflow service](https://geoglows.ecmwf.int/)

Information regarding the GEOGloWS ECMWF Streamflow service can be found at the [About page](https://geoglows.ecmwf.int/about)

## Installation

```
$ julia
julia> ]
pkg> add GEOGloWS
julia> using GEOGloWS
```

## Quick start

The GEOGloWS services provides critical historical and forecast information on streamflow for every reach across the globe. This quick start example illustrates how to request data for the Brahmaputra River near Guwahati, India.

### Requesting historical data

```julia term=true
using GEOGloWS

df = GEOGloWS.historic_simulation(26.1807, 91.7108)

df
15553×2 DataFrame
   Row │ datetime             streamflow_m^3/s
       │ DateTime…            Float64          
───────┼───────────────────────────────────────
     1 │ 1979-01-01T00:00:00       0.0
     2 │ 1979-01-02T00:00:00       3.41469
     3 │ 1979-01-03T00:00:00       26.3249
     4 │ 1979-01-04T00:00:00       68.7416
   ⋮   │          ⋮                  ⋮
 15550 │ 2021-07-28T00:00:00       24899.9
 15551 │ 2021-07-29T00:00:00       23278.6
 15552 │ 2021-07-30T00:00:00       22384.6
 15553 │ 2021-07-31T00:00:00       22817.1
                             15545 rows omitted

```


### Requesting forecast data

```julia
using GEOGloWS

df = GEOGloWS.forecast_ensembles(26.1807, 91.7108)

df
145×53 DataFrame
 Row │ datetime             ensemble_01_m^3/s  ensemble_10_m^3/s  ensemble_11_m^3/s  ensemble_12_m^3/s  ensemble_13_m^3/s  ensemble_14_m^3/s  ensemble_15_m^3/s  ensemble_16_m^3/s  ensembl ⋯
     │ DateTime…            Float64?           Float64?           Float64?           Float64?           Float64?           Float64?           Float64?           Float64?           Float64 ⋯
─────┼───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   1 │ 2021-10-16T00:00:00            10738.7            10738.7            10738.7            10738.7            10738.7            10738.7            10738.7            10738.7          ⋯
   2 │ 2021-10-16T01:00:00          missing            missing            missing            missing            missing            missing            missing            missing   
   3 │ 2021-10-16T02:00:00          missing            missing            missing            missing            missing            missing            missing            missing   
   4 │ 2021-10-16T03:00:00            10687.7            10687.6            10687.7            10687.6            10687.7            10687.6            10687.6            10687.6
  ⋮  │          ⋮                   ⋮                  ⋮                  ⋮                  ⋮                  ⋮                  ⋮                  ⋮                  ⋮                  ⋱
 142 │ 2021-10-30T06:00:00            18810.5            20950.2            18868.2            19794.4            16530.8            20430.2            17165.0            14943.7          ⋯
 143 │ 2021-10-30T12:00:00            19617.2            21530.3            19545.2            20586.4            17056.5            21485.9            17189.7            15129.7
 144 │ 2021-10-30T18:00:00            20127.3            21759.9            19995.9            21154.5            17334.7            22283.9            17025.3            15103.7
 145 │ 2021-10-31T00:00:00            20292.8            21616.3            20157.9            21426.9            17329.0            22724.2            16667.9            14857.3
                                                                                                                                                              44 columns and 137 rows omitted
```

For more information on the methods the signatures, please see the [API documentation]()
