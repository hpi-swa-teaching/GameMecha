event handling
mouseMove: anEvent

	self enabled ifFalse: [^ nil].

	self updateVisualState: anEvent