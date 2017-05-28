as yet unclassified
onKeyUp: aKeyboardEvent
	"passed through by the main morph"
	| key |
	key := aKeyboardEvent keyCharacter asUppercase.
	
	(self pressedKeys includes: key asciiValue) ifTrue: [
	self pressedKeys remove: key asciiValue.].

	"run key up handlers"
	(self keyUpHandlers includesKey: key asciiValue) ifTrue: [
		(self keyUpHandlers at:key asciiValue) value].