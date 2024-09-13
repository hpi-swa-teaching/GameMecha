textual user input
setPadding: aText
	"Takes user input, tries to convert it, and if suitable applies it to padding"
	
	| newSize |
	newSize := self parsePaddingSize: aText.
	newSize ifNil: [^ true].
	
	self tileMap rescaleMapWidth: self getGridWidth height: self getGridHeight padding: newSize.
	self changed: #getPaddingAsString.
	
	^ true
