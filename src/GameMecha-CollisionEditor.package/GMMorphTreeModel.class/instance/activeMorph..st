accessing
activeMorph: aMorph

	self
		activeMorph: aMorph;
		changed: #selectedMorph;
		changed: #morphTree.
	self editor activeMorph: aMorph