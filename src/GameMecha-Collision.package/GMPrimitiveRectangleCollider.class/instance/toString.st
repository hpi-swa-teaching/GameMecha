serialization
toString

	| string |
	self calculatePropertiesForSerialization.
	string := STON toString: self.
	self recoverPropertiesAfterSerialization.
	^ string