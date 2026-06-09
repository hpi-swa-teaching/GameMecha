collision
collisionEventOf: aMorph with: anotherMorph

	| reason event |
	self assertCollider: aMorph.
	self assertCollider: anotherMorph.
	
	"Morphs should not be able to collide with themselves"
	aMorph ~~ anotherMorph ifFalse: [^ GMNullCollisionEvent new].
	
	reason := aMorph collider collisionEventWith: anotherMorph collider.
	reason hasCollided ifFalse: [^ reason].
	event := GMMorphCollisionEvent newBetween: aMorph and: anotherMorph withReason: reason.
	
	^ event