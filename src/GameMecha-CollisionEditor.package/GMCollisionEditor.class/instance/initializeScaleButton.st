initialize-release
initializeScaleButton

	^ self initializeThemeButton: 'Zoom' Target: [ | scaleInput |
		scaleInput := self initializeScaleInput contents asString.
		scaleInput := [scaleInput asNumber] on: Error do: [nil].
		(scaleInput notNil and: [scaleInput >= 0.1])
			ifTrue: [self canvasMorph scaleFactor: scaleInput]
			ifFalse: [UIManager default inform: 'Something went wrong. Please enter a number above 0.1.']]