This C# version of the application can be built using dotnet core or
using VisualStudio/msbuild.

# Dotnet core

The command
```
dotnet run
```
will build and run the application.

# Msbuild

The solution file should build everything, and does not depend on any
external third-party libraries. However, note that the location of the
sample data files implies that the application is best run from the
command line, rather than from inside your IDE. Simply change to the
top-level folder in the csharp project tree and run the application
exe with no arguments.

# To run the tests

```
make test
```
runs the common test suite that is shared by all language variants of the application.
This depends on the Ruby `rspec` tool, which must be on your path.

