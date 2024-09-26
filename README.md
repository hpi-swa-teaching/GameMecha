# Game Mechanics ![build status](https://github.com/hpi-swa-teaching/GameMecha/actions/workflows/main.yml/badge.svg?branch=master)
We are creating a game library.

## How to install
1. Get [Squeak 6.0 or later](http://www.squeak.org)
2. Load [Metacello](https://github.com/metacello/metacello)
3. Finally, load the library with the following command:

```Smalltalk
Metacello new
  baseline: 'GameMecha';
  repository: 'github://hpi-swa-teaching/GameMecha/src';
  load.
```

## How to use
The library comes with an extensive documentation in tests and class comments. You can load these by executing:

```Smalltalk
Metacello new
  baseline: 'GameMecha';
  repository: 'github://hpi-swa-teaching/GameMecha/src';
  load: 'test'.
```

You can find the examples in the ```GameMecha-Examples``` class category.
