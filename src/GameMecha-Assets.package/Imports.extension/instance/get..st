*GameMecha-Assets
get: name
	^ self get: name ifAbsentPut: [self importFileNamed: name].