logic
doButtonAction
	"Perform the action of this button. The default behavior is to send the button's actionSelector to its target object with its arguments."

	(self target notNil and: [self actionSelector notNil]) 
		ifTrue: [self arguments 
			ifNil: [self target perform: self actionSelector]
			ifNotNil: [self target perform: self actionSelector withArguments: self arguments]].
	"If this button is not linked with any others, go back to the unpressedImage. If it is, set all linked buttons to their unpressed state, and keep this button pressed, to show the selection."
	self buttonGroup
		ifNil: [self setImageMode: #unpressed]
		ifNotNil: [self buttonGroup do: [:aButton | (aButton ~~ self) ifTrue: [aButton setImageMode: #unpressed]]]