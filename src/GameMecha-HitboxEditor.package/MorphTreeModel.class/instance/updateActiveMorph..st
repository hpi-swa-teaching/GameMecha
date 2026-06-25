event-handling
updateActiveMorph: aMorph

	self changed: #activeMorph.
	self changed: #morphTree.
	self editor activeMorph: aMorph