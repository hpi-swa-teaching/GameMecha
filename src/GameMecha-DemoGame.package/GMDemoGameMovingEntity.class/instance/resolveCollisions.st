game logic
resolveCollisions
	"the entity asks the collisionHandler for all morphs colliding with it. Then it will treat the collision. renderedMorph is called to abstract between aCollisionMoprhs which are game entities and ones which are TransformationMorphs containing game entities"
	(self game collisionHandler morphsCollidingWith: self spatialMorph)
		do: [:aCollisionMorph | self collidedWith: aCollisionMorph renderedMorph].