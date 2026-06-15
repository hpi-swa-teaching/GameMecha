visualization
spawnRepresentativeMorphInRelationTo: aMorph

	self children do: [:c | c spawnRepresentativeMorphInRelationTo: aMorph]