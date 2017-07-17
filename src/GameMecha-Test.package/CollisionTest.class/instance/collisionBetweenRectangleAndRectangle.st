collision
collisionBetweenRectangleAndRectangle
	collider1 bounds: (82@38 corner: 160@147).
	
	"uncomment these lines and step through the debugger to visualize the testing process"
	"collider1 openInWorld.
	collider2 openInWorld.
	Debugger halt."
	
	collider2 bounds: (12@94 corner: 65@117)."left of rectangle1"
	self deny: (collider1 intersects: collider2).
	self deny: (collider2 intersects: collider1).
	
	collider2 bounds: (52@74 corner: 105@97). "cutting through left edge of rectangle1"
	self assert: (collider1 intersects: collider2).
	self assert: (collider2 intersects: collider1).
	
	collider2 bounds: (93@80 corner: 146@103). "completely inside of rectangle1"
	self assert: (collider1 intersects: collider2).
	self assert: (collider2 intersects: collider1).
	
	collider2 bounds: (57@31 corner: 110@54). "one corner inside of rectangle1"
	self assert: (collider1 intersects: collider2).
	self assert: (collider2 intersects: collider1).
	
	collider2 bounds: (52@80 corner: 181@103). "cutting through left and right edge of rectangle1"
	self assert: (collider1 intersects: collider2).
	self assert: (collider2 intersects: collider1).
	
	collider2 bounds: (174@168 corner: 227@191). "on the right of and below rectangle1"
	self deny: (collider1 intersects: collider2).
	self deny: (collider2 intersects: collider1).