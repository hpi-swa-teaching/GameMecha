test cases
testIsKeyPressed
	self deny: [self keyMorph gmIsKeyPressed: self keyCharacter].
	(self createKeyboardEventOfType: #keyDown withValue: self keyValue) sentTo: self keyMorph.
	self assert: [self keyMorph gmIsKeyPressed: self keyCharacter].
	(self createKeyboardEventOfType: #keyUp withValue: self keyValue) sentTo: self keyMorph.
	self deny: [self keyMorph gmIsKeyPressed: self keyCharacter].