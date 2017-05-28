as yet unclassified
onKeyDown: aKeyboardEvent
	"passed through by the main morph"
	| key |
	key := aKeyboardEvent keyCharacter asUppercase.
	
	"run keydown handler(s)"
	(self keyDownHandlers includesKey: key asciiValue) ifTrue: [
		(self keyDownHandlers at:key asciiValue) value].
	
	"mark key as pressed"
	self pressedKeys add: key asciiValue.