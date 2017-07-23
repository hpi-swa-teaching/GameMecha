as yet unclassified
testKeyBindingHandlers
	"Testing Actions"
	|morph up downCounter upCounter changedCounter|
	upCounter := 0.
	downCounter := 0.
	changedCounter := 0.
	morph := RectangleMorph new.
	
	morph registerKeyHandler: KeyHandler new.
	up := KeyBinding new.
	up bindToKey: #keyArrowUp.
	up onDownDo: [downCounter := downCounter + 1].
	up onChangedDo: [:status | status ifTrue: [changedCounter := changedCounter + 1] ifFalse: [changedCounter := changedCounter + 2]].
	up onUpDo: [upCounter := upCounter + 1].
	morph eventHandler addBinding: up as: #up. 
	
	self assert: downCounter equals: 0.
	self assert: upCounter equals: 0.
	self assert: changedCounter equals: 0.
	(self class generateKeyboardEventOfType: #keyDown withKey: #keyArrowUp) sentTo: morph.	
	self assert: downCounter equals: 1.
	self assert: upCounter equals: 0.
	self assert: changedCounter equals: 1.
	(self class generateKeyboardEventOfType: #keyUp withKey: #keyArrowUp) sentTo: morph.
	self assert: upCounter equals: 1.
	self assert: downCounter equals: 1.
	self assert: changedCounter equals: 3.