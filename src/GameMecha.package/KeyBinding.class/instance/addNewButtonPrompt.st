reconfiguration
addNewButtonPrompt
	|morph|
	morph := RectangleMorph new.
	morph registerKeyHandler: KeyHandler new.
	morph eventHandler addEventHandler: [:keyCode | self bindToKey: (KeyHandler inputFromKeyCode: keyCode). morph delete].
	morph openInWorld.