*GameMecha-Animations
importObject: anImage named: aName 
	imports
		at: aName
		ifPresent: [Error signal: 'duplicate key!']
		ifAbsentPut: anImage.