calculations
calculateCenter: aMorph

	^ aMorph center - self morph center * (self scaleFactor: aMorph)