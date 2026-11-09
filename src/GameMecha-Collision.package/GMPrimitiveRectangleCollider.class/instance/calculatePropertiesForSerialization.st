serialization
calculatePropertiesForSerialization

	super calculatePropertiesForSerialization.
	self width: self width / Display relativeUiScaleFactor.
	self height: self height / Display relativeUiScaleFactor