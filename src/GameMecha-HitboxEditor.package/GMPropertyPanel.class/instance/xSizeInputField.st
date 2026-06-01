accessing
xSizeInputField

	^xSizeInputField ifNil: [xSizeInputField := self inputField.] 