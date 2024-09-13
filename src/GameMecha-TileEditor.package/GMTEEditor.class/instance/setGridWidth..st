textual user input
setGridWidth: aText
	"Takes user input, tries to convert it, and if suitable applies it to grid width"
	
	| oldSize newWidth |
	oldSize := self getGridWidth @ self getGridHeight.
	newWidth := self parseGridSize: aText.
	newWidth ifNil: [^ true].
	
	self
		addCommand: (GMTETilemapSizeCommand prevSize: oldSize newSize: newWidth @ oldSize y  editor: self);
		rescaleGridWidth: newWidth.
		
	^ true
