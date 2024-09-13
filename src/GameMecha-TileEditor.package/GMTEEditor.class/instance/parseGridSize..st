textual user input
parseGridSize: aText
	"Converts an input grid size (height/width) if valid"
	
	| newSize |
	newSize := self parseSize: aText.
	(newSize notNil and: [newSize isInteger and: [GMTEEditor tileMapMinGridSize < newSize and: [newSize < GMTEEditor tileMapMaxGridSize]]])
		ifTrue: [^ newSize]
		ifFalse: [^ nil]