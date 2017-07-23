accessing
handlesAllEvents
	handlesAllEvents ifNil: [self handlesAllEvents: false].
	^ handlesAllEvents.