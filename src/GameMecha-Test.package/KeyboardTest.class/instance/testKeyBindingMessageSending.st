as yet unclassified
testKeyBindingMessageSending
	"Testing Actions"
	|morph up down collection|
	morph := RectangleMorph new.
	
	collection := OrderedCollection new.
	collection add: 0.
	
	morph registerKeyHandler: KeyHandler new.
	up := KeyBinding new.
	up bindToKey: #keyArrowUp.
	up onDownSend: #removeAll to: collection.
	morph eventHandler addBinding: up as: #up. 
	down := KeyBinding new.
	down bindToKey: #keyArrowDown.
	down onUpSend: #removeAll to: collection.
	morph eventHandler addBinding: down as: #down. 
	
	self deny: collection isEmpty.
	(self class generateKeyboardEventOfType: #keyDown withKey: #keyArrowUp) sentTo: morph.	
	self assert: collection isEmpty.
	
	up onChangedSend: #add: to: collection.
	(self class generateKeyboardEventOfType: #keyUp withKey: #keyArrowUp) sentTo: morph.
	self deny: collection isEmpty.
	self assert: false equals: (collection at: 1).
	
	(self class generateKeyboardEventOfType: #keyDown withKey: #keyArrowDown) sentTo: morph.	
	self deny: collection isEmpty.
	(self class generateKeyboardEventOfType: #keyUp withKey: #keyArrowDown) sentTo: morph.
	self assert: collection isEmpty.