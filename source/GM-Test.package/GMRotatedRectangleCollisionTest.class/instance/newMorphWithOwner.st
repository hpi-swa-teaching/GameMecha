accessing
newMorphWithOwner
	"necessary, because TransformationMorph expects an owner"
	| ownedMorph |
	ownedMorph := Morph new.
	Morph new addMorph: ownedMorph.
	^ ownedMorph 