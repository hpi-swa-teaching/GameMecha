textual user input
parseBrushRadius: aText
	"Converts a brush radius if valid"
	
	| newSize |
	newSize := self parseSize: aText.
	(newSize notNil and: [newSize isInteger and: [GMTEEditor minBrushRadius < newSize and: [newSize < GMTEEditor maxBrushRadius]]])
		ifTrue: [^ newSize]
		ifFalse: [^ nil]