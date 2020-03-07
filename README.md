# Collect

## Developing Collect

### Pre-requisites

- Cabal package manager
- GHC Haskell (2010)

### Running locally

```bash
cabal new-run collect
```

### Adding new packages

```bash
cabal new-install [package-name]
```

## Building artifact

```bash
cabal new-build exe:collect --builddir=dist
```

The resulting artifact will be located in: 

- On x86_64 -> e.g. `dist/build/x86_64-windows/ghc-8.6.5/collect-0.1.0.0/x/collect/build/collect/collect.exe`