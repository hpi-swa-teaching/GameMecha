stepping and presenter
moveCollisionMorphCircle
	self collisionMorphCircle 
		position: (self collisionMorphCircle position + self class collisionMorphSpeed).
	self collisionMorphCircle position x > (self clipPosition x + self position x) 
		ifTrue: [self collisionMorphCircle 
			position: self position x @ self collisionMorphCircle position y].
	self collisionMorphCircle position y > (self clipPosition y + self position y) 
		ifTrue: [self collisionMorphCircle 
			position: self collisionMorphCircle position x @ self position y].