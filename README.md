# Collect

## Developing Collect

### Pre-requisites

- Stack package manager (>= 2.1.3)
- GHC Haskell (2010)

### Running locally

```bash
stack run
```

### Running tests

Execute HSpec test cases via

```bash
stack test
```

## Building artifact

```bash
stack install
```

The resulting artifact will be located in: 

- On Windows x86_64 -> e.g. `~\AppData\Roaming\Local\bin` (available through CLI)