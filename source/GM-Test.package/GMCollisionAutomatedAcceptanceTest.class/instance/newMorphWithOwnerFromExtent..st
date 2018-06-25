as yet unclassified
newMorphWithOwnerFromExtent: anExtent
	"necessary, because TransformationMorph expects an owner"
	| ownedMorph |
	ownedMorph := Morph new
		extent: anExtent;
		yourself.
	Morph new addMorph: ownedMorph.
	^ ownedMorph 