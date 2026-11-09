deserialization
calculatePropertiesAfterDeserialization

	super calculatePropertiesAfterDeserialization.
	self children do: [:each | each calculatePropertiesAfterDeserialization]