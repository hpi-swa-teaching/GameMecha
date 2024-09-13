textual user input
setBrushRadius: userInput
	"Takes user input, tries to convert it, and if suitable applies it to brush radius"
	
	| newRadius |
	newRadius := self parseBrushRadius: userInput.
	newRadius ifNil: [^ true].
	
	self brush radius: newRadius.
	self changed: #getBrushRadiusAsString.
		
