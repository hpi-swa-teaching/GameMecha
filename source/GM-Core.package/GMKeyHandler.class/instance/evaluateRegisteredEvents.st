key events
evaluateRegisteredEvents
	|pair|
	self pressedKeys do: [:pressedKeyCharacter | 
		(self keyToEventMappings at: pressedKeyCharacter ifAbsent: []) value.
		pair := self keyToMethodMappings at: pressedKeyCharacter ifAbsent:[].
		pair key perform: pair value].
	
	