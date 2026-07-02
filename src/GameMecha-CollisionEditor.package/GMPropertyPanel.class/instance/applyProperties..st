event handling
applyProperties: evt

	| activeHitbox newX newY newW newH newRotation rect |
	evt keyCharacter = Character cr ifFalse: [^ self].
	activeHitbox := self editor canvasMorph activeMorph.
	activeHitbox isNil ifTrue: [^ self].
	
	newX := Integer readFrom: self xPosInputField contents readStream.
	newY := Integer readFrom: self yPosInputField contents readStream.
	
	newW := Integer readFrom: self xSizeInputField contents readStream ifFail: [nil].
	newH := Integer readFrom: self ySizeInputField contents readStream ifFail: [nil].
	newRotation := Float readFrom: self rotationInputField contents readStream ifFail: [nil].
	
	activeHitbox contentIsCircle ifTrue: [ | currentSize |
		currentSize := activeHitbox content width.
		newW = currentSize ifTrue: [newW := newH] ifFalse: [newH := newW]].
	
	rect := Rectangle exactCenter: (newX @ newY) extent: newW @ newH.
	activeHitbox updateBounds: rect.
	newRotation ifNotNil: [activeHitbox rotation: newRotation].
	self updateFrom: activeHitbox