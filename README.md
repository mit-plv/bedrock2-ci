# Continuous Integration for bedrock2

## Build

```
git clone --recurse-submodules git@github.com:mit-plv/bedrock2-ci.git
```

Note: Alternatively, you can also use https:

```
git clone --recurse-submodules https://github.com/mit-plv/bedrock2-ci.git
```

The submodule URLs are relative, so that the submodules will be cloned using the same protocol as the parent repo. This is useful because travis only supports https, but locally, you probably want git.

If you forgot `--recurse-submodules`, you can clone the submodules afterwards:

```
make clone_all
```

Then simply run `make` or `make -j` or `make -jN` where `N` is the number of cores to use. This will invoke the Makefiles of each subproject in the correct order, and also pass the `-j` switch to the recursive make.
