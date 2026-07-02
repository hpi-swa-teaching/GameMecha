accessing
activeMorph: aResizeContainer

	self deactivateSelectionColor: self activeMorph.
	activeMorph := aResizeContainer.
	self activateSelectionColor: self activeMorph.
	self editor ifNotNil: [self editor propertyPanel updateFrom: aResizeContainer].
	self  activeMorph ifNotNil: [self editor activeMorph: self activeMorph content].
	self changed: #activeMorph