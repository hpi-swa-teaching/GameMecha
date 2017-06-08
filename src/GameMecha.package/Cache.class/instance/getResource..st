io
getResource: path
	"return a resource content as string"
	^ (self getResourceAsStream: path) contentsOfEntireFile.