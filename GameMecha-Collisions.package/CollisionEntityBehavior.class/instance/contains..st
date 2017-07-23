containing
contains: otherMorph
	"returns true, if the otherMorph lies completely inside of me"
	^ otherMorph collisionBehavior containedBy: self.