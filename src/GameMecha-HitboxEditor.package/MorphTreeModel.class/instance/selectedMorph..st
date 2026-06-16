accessing
selectedMorph: aMorph

	selectedMorph := aMorph.
	self changed: #selectedMorph.
	self changed: #morphTree.
	self editor selectedMorph: aMorph