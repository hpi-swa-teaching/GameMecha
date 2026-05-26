collision
isCollidingWithRectanglePrimitiveAABB: aRectangleCollider

 	| aHalfW aHalfH bHalfW bHalfH |
	aHalfW := self width / 2.0.
	aHalfH := self height / 2.0.
	bHalfW := aRectangleCollider width / 2.0.
	bHalfH := aRectangleCollider height / 2.0.
	self position x + aHalfW < (aRectangleCollider position x - bHalfW) ifTrue: [^ false].
	self position x - aHalfW > (aRectangleCollider position x + bHalfW) ifTrue: [^ false].
	self position y + aHalfH < (aRectangleCollider position y - bHalfH) ifTrue: [^ false].
	self position y - aHalfH > (aRectangleCollider position y + bHalfH) ifTrue: [^ false].
	^ true