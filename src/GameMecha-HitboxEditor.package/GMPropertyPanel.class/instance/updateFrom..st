event handling
updateFrom: aMorph

	aMorph isNil ifTrue: [
		self xPosInputField contents: ''.
		self yPosInputField contents: ''.
		self xSizeInputField contents: ''.
		self ySizeInputField contents: ''.
		self rotationInputField contents: ''.
		^ self].
	
	self xPosInputField contents: aMorph center x printString.
	self yPosInputField contents: aMorph center y printString.
	self xSizeInputField contents: aMorph content width printString.
	self ySizeInputField contents: aMorph content height printString.
	self rotationInputField contents: aMorph rotation radiansToDegrees ceiling printString