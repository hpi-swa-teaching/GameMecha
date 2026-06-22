drawing
removeMorphFromCanvas: aMorph

	(self submorphs includes: aMorph) ifTrue: [self removeMorph: aMorph]