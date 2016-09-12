# corner-shop
Text-based shop application for training workshops

## Running the tests ##

```
make test
```
builds every language variant and runs the same suite of tests against each.
In order for this to work, every language variant provides a `Makefile`
with a `run` target that runs the application (building it first, if necessary).
