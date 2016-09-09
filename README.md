# corner-shop
Text-based shop application for training workshops

See the language-specific README files for details
of how to build and run each version of the application.

## Running the tests ##

```
make spec
```
runs a suite of tests against all language variants of the application.
In order for this to work, every language variant must provide a `Makefile`
with a `run` target that runs the application (building it first, if necessary).
