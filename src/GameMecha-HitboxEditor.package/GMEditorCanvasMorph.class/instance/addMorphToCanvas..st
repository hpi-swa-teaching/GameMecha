drawing
addMorphToCanvas: aMorph

	aMorph
		position: self center - aMorph center;
		stopStepping.
	
	self viewport addMorph: aMorph.
	aMorph center: 0 @ 0