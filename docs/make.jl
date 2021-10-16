push!(LOAD_PATH,"../src/")

using Documenter, GEOGloWS

pages = [
    "Home" => "index.md",
    "API" => "api.md",
]

makedocs(;
    modules = [GEOGloWS],
    authors = "Kel Markert",
    repo = "https://github.com/KMarkert/GEOGloWS.jl/blob/{commit}{path}#L{line}",
    sitename = "GEOGloWS.jl",
    # format = Documenter.HTML(;
    #     prettyurls = get(ENV, "CI", "false") == "true",
    #     canonical = "https://deltares.github.io/Wflow.jl",
    #     assets = String[],
    # ),
    pages = pages,
)

deploydocs(;
    repo = "github.com/KMarkert/GEOGloWS.jl.git",
    devbranch = "main"
)
