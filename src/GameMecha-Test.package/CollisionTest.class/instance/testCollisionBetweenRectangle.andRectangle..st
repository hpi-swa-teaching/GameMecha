collision
testCollisionBetweenRectangle: morph1 andRectangle: morph2
	|rectangle1 rectangle2|
	rectangle1 := RectangleCollider wrap: morph1.
	rectangle2 := RectangleCollider wrap: morph2.
	rectangle1 bounds: (82@38 corner: 160@147).
	
	"uncomment these lines and step through the debugger to visualize the testing process"
	"rectangle1 openInWorld.
	rectangle2 openInWorld.
	Debugger halt."
	
	rectangle2 bounds: (12@94 corner: 65@117)."left of rectangle1"
	self deny: (rectangle1 intersects: rectangle2).
	self deny: (rectangle2 intersects: rectangle1).
	
	rectangle2 bounds: (52@74 corner: 105@97). "cutting through left edge of rectangle1"
	self assert: (rectangle1 intersects: rectangle2).
	self assert: (rectangle2 intersects: rectangle1).
	
	rectangle2 bounds: (93@80 corner: 146@103). "completely inside rectangle1"
	self assert: (rectangle1 intersects: rectangle2).
	self assert: (rectangle2 intersects: rectangle1).
	
	rectangle2 bounds: (128@80 corner: 181@103). "cutting through right edge of rectangle1"
	self assert: (rectangle1 intersects: rectangle2).
	self assert: (rectangle2 intersects: rectangle1).
	
	rectangle2 bounds: (174@168 corner: 227@191). "on the right of and below rectangle1"
	self deny: (rectangle1 intersects: rectangle2).
	self deny: (rectangle2 intersects: rectangle1).