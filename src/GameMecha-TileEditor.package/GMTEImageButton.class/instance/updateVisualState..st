visual properties
updateVisualState: anEvent

	"Guard to check whether this button is allowed to react to mouse input"
	self enabled 
		ifFalse: [
			self setImageMode: 'disabled'.
			^ nil].
		
	self buttonGroup
		ifNil: [self updateVisualStateUngrouped: anEvent]
		ifNotNil: [self updateVisualStateGrouped: anEvent]