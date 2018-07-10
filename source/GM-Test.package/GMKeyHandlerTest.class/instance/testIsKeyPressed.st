testing
testIsKeyPressed
	self deny: [self keyTestMorph gmIsKeyPressed: $s].
	(self class testKeyboardEventOfType: #keyDown withValue: self keyTestValue) sentTo: self keyTestMorph. 
	self assert: [self keyTestMorph gmIsKeyPressed: $s].
	(self class testKeyboardEventOfType: #keyUp withValue: self keyTestValue) sentTo: self keyTestMorph.
	self deny: [self keyTestMorph gmIsKeyPressed: $s].