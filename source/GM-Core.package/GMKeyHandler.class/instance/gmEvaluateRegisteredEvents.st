key events
gmEvaluateRegisteredEvents
	| invocation |
	self pressedKeys do: [:pressedKeyCharacter | 
		(self keyToEventMappings at: pressedKeyCharacter ifAbsent: []) value.
		invocation := self keyToMethodMappings at: pressedKeyCharacter ifAbsent: [].
		invocation ifNotNil: [invocation key perform: invocation value]].