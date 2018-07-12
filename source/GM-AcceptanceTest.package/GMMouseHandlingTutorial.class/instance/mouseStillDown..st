event handling
mouseStillDown: anEvent
"Overwritten to handle mouseStillDown. This event is thrown every step as long as the left mouse button ist down.
Attention the step rate for this is defined in mouseStillDownStepRate
not in stepTime as it is the case for the 'normal' stepping."
	super mouseStillDown: anEvent.
	self extent: self extent + (5 @ 5).