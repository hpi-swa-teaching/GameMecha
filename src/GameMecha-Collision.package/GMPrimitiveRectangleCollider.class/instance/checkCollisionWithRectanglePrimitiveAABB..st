collision
checkCollisionWithRectanglePrimitiveAABB: aRectangleCollider

	| aHalfW aHalfH bHalfW bHalfH |
	aHalfW := self width / 2.0.
	aHalfH := self height / 2.0.
	bHalfW := aRectangleCollider width / 2.0.
	bHalfH := aRectangleCollider height / 2.0.
	
	self center x + aHalfW < (aRectangleCollider center x - bHalfW) ifTrue: [^ false].
	self center x - aHalfW > (aRectangleCollider center x + bHalfW) ifTrue: [^ false].
	self center y + aHalfH < (aRectangleCollider center y - bHalfH) ifTrue: [^ false].
	self center y - aHalfH > (aRectangleCollider center y + bHalfH) ifTrue: [^ false].
	
	^ true