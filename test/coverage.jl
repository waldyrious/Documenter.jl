# Only run coverage from Julia 0.6 Linux build on Travis.
get(ENV, "TRAVIS_OS_NAME", "")       == "linux"   || exit()
get(ENV, "TRAVIS_JULIA_VERSION", "") == "0.6" || exit()

Pkg.add("Coverage")
using Coverage

cd(joinpath(dirname(@__FILE__), "..")) do
    Codecov.submit(Codecov.process_folder())
end
