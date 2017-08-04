accessing
isActionKeyDown: anAction
	^ (self bindings at: anAction) 
		keys anySatisfy: [:key | (self pressedKeys includes: key)].