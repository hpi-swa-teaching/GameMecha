accessing
isActionKeyDown: anAction
	|checker|
	checker := [:keyAscii | (self pressedKeys includes: keyAscii)
				ifTrue: [^ true]].
	(self bindings at: anAction) 
		keys do: [:key | checker value: key].
	^ false.