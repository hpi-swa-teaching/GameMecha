as yet unclassified
fileExists: localPath
	|pathCollection dir|
	"TODO do not use the cache class here"
	pathCollection := (Cache pathToCollection: localPath).
	
	dir := FileDirectory default.
	1 to: (pathCollection size - 1)
		do: [:i | dir := dir / (pathCollection at: i)].
		
	^ dir fileExists: (pathCollection last).