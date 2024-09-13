textual user input
setGridHeight: aText
	"Takes user input, tries to convert it, and if suitable applies it to grid height"
	
	| oldSize newHeight |
	oldSize := self getGridWidth @ self getGridHeight.
	newHeight := self parseGridSize: aText.
	newHeight ifNil: [^ true].
	
	self
		addCommand: (GMTETilemapSizeCommand prevSize: oldSize newSize: oldSize x @ newHeight editor: self);
		rescaleGridHeight: newHeight.
		
	^ true
		
