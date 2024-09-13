removing
free
	"Fully delete morph"

	self owner ifNotNil: [self owner removeMorph: self].
	self abandon