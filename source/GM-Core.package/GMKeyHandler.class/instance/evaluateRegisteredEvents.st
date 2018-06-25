key events
evaluateRegisteredEvents
	self pressedKeys do: [:pressedKeyCharacter | (self keyToEventMappings at: pressedKeyCharacter ifAbsent: []) value].
	"Transcript showln: self pressedKeys."