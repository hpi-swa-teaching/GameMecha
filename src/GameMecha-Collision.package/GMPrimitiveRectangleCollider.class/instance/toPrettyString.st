serialization
toPrettyString

	| string |
	self calculatePropertiesForSerialization.
	string := STON toStringPretty: self.
	self recoverPropertiesAfterSerialization.
	^ string