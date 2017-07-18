*GameMecha-Animations
importObject: anImage named: aName 
	imports
		at: aName
		ifPresent: [:value | Error signal: 'duplicate key: ', aName]
		ifAbsentPut: anImage.