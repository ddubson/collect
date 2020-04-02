[![Build Status](https://travis-ci.org/ddubson/collect.svg?branch=master)](https://travis-ci.org/ddubson/collect)

# Collect

## Developing Collect

### Pre-requisites

- Stack package manager (>= 2.1.3)
- GHC (2010)

### Running locally

```bash
stack run
```

### Running tests

Execute HSpec test cases via

```bash
# Run all specs
stack test

# Run individual spec by matcher keyword
stack test --ta=--match=[keyword]
```

## Building artifact

```bash
stack install
```

The resulting artifact will be located in: 

- On Windows x86_64 -> e.g. `~\AppData\Roaming\Local\bin` (available through CLI)