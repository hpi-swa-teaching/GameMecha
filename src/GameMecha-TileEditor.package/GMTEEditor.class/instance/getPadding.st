accessing
getPadding
	"Returns the padding of the tileMap"
	
	self tileMap 
		ifNotNil: [^ self tileMap mapPadding]
		ifNil: [^ nil]