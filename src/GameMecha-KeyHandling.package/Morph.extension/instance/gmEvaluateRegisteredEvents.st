*GameMecha-KeyHandling
gmEvaluateRegisteredEvents
	self eventHandler class = GMKeyHandler 
		ifTrue: [self extension eventHandler gmEvaluateRegisteredEvents] 
		ifFalse: [self error: 'Morph has no GMKeyHandler'].
    