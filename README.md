# ScTenifold

*A single-cell gene regulatory network analysis suite in Julia.*

## Installation

First of all, you need to install a Julia compiler.  A recommended way is to
download a pre-built binary of Julia. The pre-built binaries for several major
platforms are distributed at <https://julialang.org/downloads/>. Currently,
`ScTenifold.jl` is an unregistered package.

Then, install `ScTenifold.jl` with the following command:

```julia
julia> using Pkg; Pkg.add(PackageSpec(url="git://github.com/jamesjcai/ScTenifold.jl.git"))
```

To check the installation, you can try `using ScTenifold` in your REPL:

    $ julia
       _       _ _(_)_     |  Documentation: https://docs.julialang.org
      (_)     | (_) (_)    |
       _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
      | | | | | | |/ _` |  |
      | | |_| | | | (_| |  |  Version 1.5.3 (2020-11-09)
     _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org/ release
    |__/                   |

    julia> using ScTenifold
    [ Info: Precompiling ScTenifold [fcca1770-266e-4af5-8612-876362e279e9]

    julia>


No error messages mean you have successfully installed ScTenifold.jl.

To run unit tests, execute the following command:

    $ julia -e 'using Pkg; Pkg.test("ScTenifold")'


## Contributing and Questions

Contributions are very welcome, as are feature requests and suggestions. Please open an
[issue][issues-url] if you encounter any problems or would just like to ask a question.

[issues-url]: https://github.com/jamesjcai/ScTenifold.jl/issues
