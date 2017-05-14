collision
testCollisionBetweenCircle: morph1 andCircle: morph2
	|circle1 circle2|
	circle1 := CircleCollider wrap: morph1.
	circle2 := CircleCollider wrap: morph2.
	circle1 bounds: (133@74 corner: 294@235).
	
	"uncomment these lines and step through the debugger to visualize the testing process"
	"circle1 openInWorld.
	circle2 openInWorld.
	Debugger halt."
	
	circle2 bounds: (68@69 corner: 108@109). "left of circle1"
	self deny: (circle1 intersects: circle2).
	self deny: (circle2 intersects: circle1).
	
	circle2 bounds: (112@66 corner: 152@106). "directly next to circle1, so that the BBs collide but the circles don't"
	self deny: (circle1 intersects: circle2).
	self deny: (circle2 intersects: circle1).
	
	circle2 bounds: (128@87 corner: 168@127). "half way inside circle1 on top left"
	self assert: (circle1 intersects: circle2).
	self assert: (circle2 intersects: circle1).
	
	circle2 bounds: (179@122 corner: 219@162). "completely inside circle1"
	self assert: (circle1 intersects: circle2).
	self assert: (circle2 intersects: circle1).
	
	circle2 bounds: (249@190 corner: 289@230). "half way inside circle1 on bottom right"
	self assert: (circle1 intersects: circle2).
	self assert: (circle2 intersects: circle1).
	
	circle2 bounds: (198@251 corner: 238@291). "under circle1"
	self deny: (circle1 intersects: circle2).
	self deny: (circle2 intersects: circle1).