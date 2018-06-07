testing
testIsKeyPressed
	self deny: [self keyTestMorph isKeyPressed: $s].
	(self class testKeyboardEventOfType: #keyDown withValue: self keyTestValue) sentTo: self keyTestMorph. 
	self flag: #todo. "process event instead of sentTo"
	self assert: [self keyTestMorph isKeyPressed: $s].
	(self class testKeyboardEventOfType: #keyUp withValue: self keyTestValue) sentTo: self keyTestMorph.
	self deny: [self keyTestMorph isKeyPressed: $s].