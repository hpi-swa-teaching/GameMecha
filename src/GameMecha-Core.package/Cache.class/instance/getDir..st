preloading
getDir: path
	|dir pathCollection|
	dir := self resourceDirectory.
	pathCollection := self class pathToCollection: path.
	1 to: (pathCollection size)
		do: [:i | dir := dir / (pathCollection at: i)].
	^ dir.