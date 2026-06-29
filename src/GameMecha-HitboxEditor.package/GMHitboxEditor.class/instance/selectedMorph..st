accessing
selectedMorph: aMorph

	"self selectedMorph ifNotNil: [self removeMorphFromCanvas: self selectedMorph]."
	selectedMorph := aMorph.