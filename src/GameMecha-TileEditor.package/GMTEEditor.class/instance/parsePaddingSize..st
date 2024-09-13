textual user input
parsePaddingSize: aText
	"Converts an input padding size if valid"
	
	| newSize |
	newSize := self parseSize: aText.
	(newSize notNil and: [GMTEEditor tileMapMinPaddingSize <= newSize and: [newSize <= GMTEEditor tileMapMaxPaddingSize]])
		ifTrue: [^ newSize]
		ifFalse: [^ nil]