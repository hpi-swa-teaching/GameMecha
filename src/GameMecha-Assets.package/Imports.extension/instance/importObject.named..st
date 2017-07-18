*GameMecha-Assets
importObject: anImage named: aName 
	self imports
		at: aName
		ifPresent: [:value | Error signal: 'duplicate key: ', aName]
		ifAbsentPut: anImage.