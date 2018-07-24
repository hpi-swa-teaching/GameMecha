key events
gmEvaluateRegisteredEvents
	self pressedKeys do: [:pressedKeyCharacter | 
		self keyToEventMappings at: pressedKeyCharacter 
			ifPresent: [:event | event value].
		self keyToMethodMappings at: pressedKeyCharacter
			ifPresent: [:invocation | invocation key perform: invocation value]].