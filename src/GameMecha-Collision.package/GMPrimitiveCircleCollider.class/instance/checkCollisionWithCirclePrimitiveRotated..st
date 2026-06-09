collision
checkCollisionWithCirclePrimitiveRotated: aCircleCollider
	"
	For pure circles (not ellipses), the collision check is the same when rotated. 
	This has to be changed, when we support ellipses.
	"

	^ self checkCollisionWithCirclePrimitiveAABB: aCircleCollider