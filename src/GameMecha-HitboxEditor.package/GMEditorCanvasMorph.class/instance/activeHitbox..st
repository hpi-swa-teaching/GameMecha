accessing
activeHitbox: aResizeContainer

	self deactivateSelectionColor: self activeHitbox.
	activeMorph := aResizeContainer.
	self activateSelectionColor: self activeHitbox.
	self editor ifNotNil: [self editor propertyPanel updateFrom: aResizeContainer].
	self changed: #activeHitbox