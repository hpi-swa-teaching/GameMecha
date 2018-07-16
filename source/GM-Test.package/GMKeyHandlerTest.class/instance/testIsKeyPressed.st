test cases
testIsKeyPressed
	self deny: [self keyMorph gmIsKeyPressed: $s].
	(self class createKeyboardEventOfType: #keyDown withValue: self keyTestValue) sentTo: self keyMorph. 
	self assert: [self keyMorph gmIsKeyPressed: $s].
	(self class createKeyboardEventOfType: #keyUp withValue: self keyTestValue) sentTo: self keyMorph.
	self deny: [self keyMorph gmIsKeyPressed: $s].