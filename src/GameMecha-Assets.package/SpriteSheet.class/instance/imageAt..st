accessing
imageAt: selector
	selector isPoint ifTrue: [^ self imageAtCoordinates: selector].
	^ self imageAtIndex: selector.