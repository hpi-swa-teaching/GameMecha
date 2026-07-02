canvas
removeMorphFromCanvas: aMorph

	self canvasMorph removeMorphFromCanvas: aMorph.
	self selectedMorph: nil.
	self classNameLabel content: ''.