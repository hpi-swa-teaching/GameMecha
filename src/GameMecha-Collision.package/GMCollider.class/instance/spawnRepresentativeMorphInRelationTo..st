visualization
spawnRepresentativeMorphInRelationTo: aMorph

	| morph |
	morph := self representationMorphType new.
	morph
		center: (self calculateRepresentationMorphCenter: aMorph);
		color: Color red.
	self assignMorphValues: morph.
	
	aMorph owner addMorph: morph