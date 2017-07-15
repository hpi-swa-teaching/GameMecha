as yet unclassified
testIsKeyDown
	|morph|
	morph := RectangleMorph new.
	
	morph registerKeyboardBindings: KeyHandler new.
	
	self deny: (morph eventHandler isKeyDown: 'a').	
	(self class generateKeyboardEventOfType: #keyDown withKey: 'a') sentTo: morph.	
	self assert: (morph eventHandler isKeyDown: 'a').	
	(self class generateKeyboardEventOfType: #keyUp withKey: 'a') sentTo: morph.
	self deny: (morph eventHandler isKeyDown: 'a').