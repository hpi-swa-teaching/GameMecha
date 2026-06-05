A GMCollisionGameCircleMorph defines an interface for CircleMorphs that want to take part in Collision. Note that the layers and mask could also be set in the top collider, but if it does not overwrite them it will inheritate them. Setting layers/mask in a child will overwrite it's parents layers/mask. Parent colliders need to always have all layers/mask set that their children have set otherwise the collision won't be detected for the missing layers/mask. composite colliders can have multiple children to enable one morph to consist of multiple shapes.
Instance Variables
	collider:		<aGMCollider>
	game:		<aGMCollisionGame>
	layers:		<anArray of Numbers>
	mask:		<anArray of Numbers>

collider
	- this can either be a GMCompositeCollider or even just a GMPrimitiveCollider. We use a GMCompositeCollider (refer to initialize)

game
	- refferance to the game instance

layers
	- objects that have one or more of the layers of this Morph in their mask will be notified (the onCollision: method will be called) 

mask
	- reffer to the layers description
