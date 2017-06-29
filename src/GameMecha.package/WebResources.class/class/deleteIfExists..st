as yet unclassified
deleteIfExists: localPath
	|pathCollection dir|
	"TODO do not use the cache class here"
	pathCollection := (Cache pathToCollection: localPath).
	
	dir := FileDirectory default.
	1 to: (pathCollection size - 1)
		do: [:i | |next|
			next := pathCollection at: i.
			(dir directoryExists: next)
				ifFalse: [dir createDirectory: next].
			dir := dir / next].
		
	dir deleteFileNamed: (pathCollection last).