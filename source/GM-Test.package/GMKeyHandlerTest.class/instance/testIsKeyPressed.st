testing
testIsKeyPressed
	self deny: [self keyMorph gmIsKeyPressed: $s].
	(self class testKeyboardEventOfType: #keyDown withValue: self keyTestValue) sentTo: self keyMorph. 
	self assert: [self keyMorph gmIsKeyPressed: $s].
	(self class testKeyboardEventOfType: #keyUp withValue: self keyTestValue) sentTo: self keyMorph.
	self deny: [self keyMorph gmIsKeyPressed: $s].