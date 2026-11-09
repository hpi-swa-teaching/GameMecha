deserialization
calculatePropertiesAfterDeserialization

	super calculatePropertiesAfterDeserialization.
	self width: self width * Display relativeUiScaleFactor.
	self height: self height * Display relativeUiScaleFactor