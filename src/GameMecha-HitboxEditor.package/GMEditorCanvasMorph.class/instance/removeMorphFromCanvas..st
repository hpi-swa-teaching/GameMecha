drawing
removeMorphFromCanvas: aMorph

	(self viewport submorphs includes: aMorph) ifTrue: [self viewport removeMorph: aMorph]