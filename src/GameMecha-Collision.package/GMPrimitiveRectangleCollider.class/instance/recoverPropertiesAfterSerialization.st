serialization
recoverPropertiesAfterSerialization

	super recoverPropertiesAfterSerialization.
	self width: self width * Display relativeUiScaleFactor.
	self height: self height * Display relativeUiScaleFactor