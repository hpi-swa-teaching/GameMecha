collision
collisionBetweenRectangleAndCircle
	"collider1 acts as a rectangleCollider"
	"collider2 acts as acircleCollider"
	collider2 bounds: (242@103 corner: 388@249). 
	
	"uncomment these lines and step through the debugger to visualize the testing process"
	"collider2 openInWorld.
	collider1 openInWorld.
	Debugger halt."
	
	collider1 bounds: (97@87 corner: 195@112). "far away"
	self deny: (collider2 intersects: collider1).
	self deny: (collider1 intersects: collider2).
	
	collider1 bounds: (160@99 corner: 258@124). "rectangle in corner of circle"
	self deny: (collider2 intersects: collider1).
	self deny: (collider1 intersects: collider2).
	
	collider1 bounds: (171@104 corner: 269@129). "rectangle corner intersects the circle"
	self assert: (collider2 intersects: collider1).
	self assert: (collider1 intersects: collider2).
	
	collider1 bounds: (334@170 corner: 374@395). "two rectangle corners inside the circle"
	self assert: (collider2 intersects: collider1).
	self assert: (collider1 intersects: collider2).
	
	collider1 bounds: (210@83 corner: 423@112). "circle cuts rectangle"
	self assert: (collider2 intersects: collider1).
	self assert: (collider1 intersects: collider2).
	
	collider1 bounds: (299@126 corner: 334@214). "rectangle inside circle"
	self assert: (collider2 intersects: collider1).
	self assert: (collider1 intersects: collider2).
	
	collider1 bounds: (155@81 corner: 463@293). "circle inside rectangle"
	self assert: (collider2 intersects: collider1).
	self assert: (collider1 intersects: collider2).