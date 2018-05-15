testing
testIsKeyPressed
	| testMorph |
	testMorph := Morph new
		gmRegisterToKeyHandler;
		yourself.
		
	self deny: [testMorph isKeyPressed: $s].
	(self class testKeyboardEventOfType: #keyDown withValue: self keyTestValue) sentTo: testMorph.
	self assert: [testMorph isKeyPressed: $s].
	(self class testKeyboardEventOfType: #keyUp withValue: self keyTestValue) sentTo: testMorph.
	self deny: [testMorph isKeyPressed: $s].