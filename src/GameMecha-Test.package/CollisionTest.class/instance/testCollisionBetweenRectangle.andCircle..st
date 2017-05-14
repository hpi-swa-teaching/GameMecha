collision
testCollisionBetweenRectangle: morph1 andCircle: morph2
	|circle rectangle|
	rectangle := RectangleCollider wrap: morph1.
	circle := CircleCollider wrap: morph2.
	circle bounds: (242@103 corner: 388@249). 
	
	"uncomment these lines and step through the debugger to visualize the testing process"
	"circle openInWorld.
	rectangle openInWorld.
	Debugger halt."
	
	rectangle bounds: (97@87 corner: 195@112). "far away"
	self deny: (circle intersects: rectangle).
	self deny: (rectangle intersects: circle).
	
	rectangle bounds: (160@99 corner: 258@124). "rectangle in corner of circle"
	self deny: (circle intersects: rectangle).
	self deny: (rectangle intersects: circle).
	
	rectangle bounds: (171@104 corner: 269@129). "rectangle corner intersects the circle"
	self assert: (circle intersects: rectangle).
	self assert: (rectangle intersects: circle).
	
	rectangle bounds: (334@170 corner: 374@395). "two rectangle corners inside the circle"
	self assert: (circle intersects: rectangle).
	self assert: (rectangle intersects: circle).
	
	rectangle bounds: (210@83 corner: 423@112). "circle cuts rectangle"
	self assert: (circle intersects: rectangle).
	self assert: (rectangle intersects: circle).
	
	rectangle bounds: (299@126 corner: 334@214). "rectangle inside circle"
	self assert: (circle intersects: rectangle).
	self assert: (rectangle intersects: circle).
	
	rectangle bounds: (155@81 corner: 463@293). "circle inside rectangle"
	self assert: (circle intersects: rectangle).
	self assert: (rectangle intersects: circle).
	