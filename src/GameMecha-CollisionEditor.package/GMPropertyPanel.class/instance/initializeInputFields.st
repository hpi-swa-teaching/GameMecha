initialize-release
initializeInputFields

	self xPosInputField: self createInputField.
	self yPosInputField: self createInputField.
	self xSizeInputField: self createInputField.
	self ySizeInputField: self createInputField.
	self rotationInputField: self createInputField.
	
	self xPosInputField on: #keyStroke send: #applyProperties: to: self.
	self yPosInputField on: #keyStroke send: #applyProperties: to: self.
	self xSizeInputField on: #keyStroke send: #applyProperties: to: self.
	self ySizeInputField on: #keyStroke send: #applyProperties: to: self.
	self rotationInputField on: #keyStroke send: #applyProperties: to: self