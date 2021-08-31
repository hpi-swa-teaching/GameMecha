# Game Mechanics ![build status](https://github.com/hpi-swa-teaching/GameMecha/actions/workflows/main.yml/badge.svg?branch=master)
We are creating a game library.

## How to install
1. Get [Squeak 5.1 or later](http://www.squeak.org)
2. Load [Metacello](https://github.com/metacello/metacello)
3. Finally, load the library with the following command:

```Smalltalk
Metacello new
  baseline: 'GM';
  repository: 'github://hpi-swa-teaching/GameMecha/source';
  load.
```

## How to use
The library comes with an extensive documentation in tests and class comments. You can load these by executing:

```Smalltalk
Metacello new
  baseline: 'GM';
  repository: 'github://hpi-swa-teaching/GameMecha/source';
  load: 'test'.
```

You can find the examples in the ```GM-AcceptanceTest``` class category.
