io
getResourceAsStream: path createIfAbsent: shouldCreate
	"return a resources (a file in the resource directory) contents as stream"
	|dir file pathCollection|
	dir := self resourceDirectory.
	pathCollection := self class pathToCollection: path.
	file := pathCollection last.
	
	1 to: (pathCollection size - 1)
		do: [:i | dir := dir / (pathCollection at: i)].
			
	Transcript showln: 'Loading ', (dir pathName), '/', file. 
	((dir fileExists: file) or: shouldCreate) ifFalse: [^ nil].
	^ (dir fileNamed: file).