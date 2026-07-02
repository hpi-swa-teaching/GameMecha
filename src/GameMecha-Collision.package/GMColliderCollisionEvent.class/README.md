A GMColliderCollisionEvent represents a collision between two colliders. It is the reason of a GMMorphCollisionEvent and describes the collision at the collider level.

Use collidedSymbols to find out which named colliders in the own collider tree were involved in the collision.

Instance Variables
	own:				<GMCollider>
	other:				<GMCollider>

own
	- the collider that the collision event belongs to
	
other
	- the collider it collided with