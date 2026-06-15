visualization
calculateRepresentationMorphCenter: aMorph

	^ aMorph center + (self center * self scaleFactor)