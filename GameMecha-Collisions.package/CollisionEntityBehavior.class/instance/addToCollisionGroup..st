accessing
addToCollisionGroup: aGroupIdentifier
	"add this collider to a collision group (so that it collides with other colliders in this group)"

	self collisionGroups add: aGroupIdentifier.