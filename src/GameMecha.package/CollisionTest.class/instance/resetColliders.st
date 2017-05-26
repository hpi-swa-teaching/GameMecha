supporting
resetColliders
	self collider1 ifNotNil: [self collider1 delete].
	self collider2 ifNotNil: [self collider2 delete].
	self collider1: nil.
	self collider2: nil.
	