testing
assertKeyUpEventInvocation: aBlock
	(self createKeyboardEventOfType: #keyUp withValue: self keyValue) sentTo: self keyMorph. 
	self keyMorph gmEvaluateRegisteredEvents.
	self assert: aBlock value equals: true.