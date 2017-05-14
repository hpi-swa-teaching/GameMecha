collision groups
removeFromCollisionGroup: aGroupIdentifier
	"remove this collider from a collision group (so that it does not collide with other colliders in this group anymore)"
	
	self collisionGroups remove: aGroupIdentifier.