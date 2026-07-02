event handling
mouseUp: evt

	self isPressed ifTrue: [self action ifNotNil: [self action value]].
	self
		isPressed: false;
		changed