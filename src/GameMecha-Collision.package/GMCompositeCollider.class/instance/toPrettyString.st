serialization
toPrettyString

	| oldCenter string |
	oldCenter := self relativeCenter.
	self calculatePropertiesForSerialization.
	self children do: [:each | each calculatePropertiesForSerialization].
	string := STON toStringPretty: self.
	self recoverPropertiesAfterSerialization.
	self children do: [:each | each recoverPropertiesAfterSerialization].
	^ string