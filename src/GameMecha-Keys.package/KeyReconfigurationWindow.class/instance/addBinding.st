accessing
addBinding
	|keyListenerWindow response|
	keyListenerWindow := self buildKeyListener.
	keyListenerWindow openInWorld.
	keyListenerWindow registerKeyHandler: KeyHandler new.
	keyListenerWindow eventHandler addEventHandler: [:keyCode  | response := KeyHandler stringFromKeyCode: keyCode].
	[response isNil and: keyListenerWindow owner isNil not] whileTrue: [World doOneSubCycle].
	keyListenerWindow delete.
	response ifNotNilDo: [:value | self selectedBinding bindToKey: value].
	self changed: #bindingKeys.