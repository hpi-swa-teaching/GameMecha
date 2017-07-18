*GameMecha-Animations-IO
importDirectory: uriOrDirectory
	| dir |
	dir := uriOrDirectory isString
		ifTrue: [FileDirectory uri: uriOrDirectory]
		ifFalse: [uriOrDirectory].
	dir exists ifFalse: [self error: dir fullName , ' does not exist'. ^ #()].
	^ (dir fileNames
		collect: [:fileName | (self get: (dir fullNameFor: fileName))])
		select: [:obj | obj notNil].