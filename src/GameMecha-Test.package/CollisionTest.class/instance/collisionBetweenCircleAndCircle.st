collision
collisionBetweenCircleAndCircle
	collider1 bounds: (133@74 corner: 294@235).
	
	"uncomment these lines and step through the debugger to visualize the testing process"
	"collider1 openInWorld.
	collider2 openInWorld.
	Debugger halt."
	
	collider2 bounds: (68@69 corner: 108@109). "left of circle1"
	self deny: (collider1 intersectsWith: collider2).
	self deny: (collider2 intersectsWith: collider1).
	
	collider2 bounds: (112@66 corner: 152@106). "directly next to collider1, so that the BBs collide but the colliders don't"
	self deny: (collider1 intersectsWith: collider2).
	self deny: (collider2 intersectsWith: collider1).	

	collider2 bounds: (128@87 corner: 168@127). "half way inside collider1 on top left"
	self assert: (collider1 intersectsWith: collider2).
	self assert: (collider2 intersectsWith: collider1).
	
	collider2 bounds: (179@122 corner: 219@162). "completely inside collider1"
	self assert: (collider1 intersectsWith: collider2).
	self assert: (collider2 intersectsWith: collider1).

	collider2 bounds: (249@190 corner: 289@230). "half way inside collider1 on bottom right"
	self assert: (collider1 intersectsWith: collider2).
	self assert: (collider2 intersectsWith: collider1).

	collider2 bounds: (198@251 corner: 238@291). "under collider1"
	self deny: (collider1 intersectsWith: collider2).
	self deny: (collider2 intersectsWith: collider1).