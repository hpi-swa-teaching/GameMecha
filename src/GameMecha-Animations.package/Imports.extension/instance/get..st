*GameMecha-Animations
get: name
	^ self get: name ifAbsentPut: [self importFileNamed: name].