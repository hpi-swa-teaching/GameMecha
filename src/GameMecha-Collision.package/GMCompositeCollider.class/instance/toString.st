serialization
toString

	| oldCenter string |
	oldCenter := self relativeCenter.
	self calculatePropertiesForSerialization.
	self children do: [:each | each calculatePropertiesForSerialization].
	string := STON toString: self.
	self recoverPropertiesAfterSerialization.
	self children do: [:each | each recoverPropertiesAfterSerialization].
	^ string