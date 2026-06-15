collision
isCollidingWith: aCollider

	^ (self maskIncludes: aCollider layers)
		and: [
			self children
				anySatisfy: [:collider | collider isCollidingWith: aCollider]
		]