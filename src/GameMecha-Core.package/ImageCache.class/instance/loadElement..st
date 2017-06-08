io
loadElement: path
	"return a resource content as textureForm"
	|stream|
	stream := self getResourceAsStream: (self ensureImageExtension: path).
	^ stream 
		ifNotNil: [Form fromBinaryStream: stream]
		ifNil: [ImageNotFound signal: (self resourceDirectory pathName , '/', path)].