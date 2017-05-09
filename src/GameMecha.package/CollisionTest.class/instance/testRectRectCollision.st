as yet unclassified
testRectRectCollision
	|r1 r2|
	r1 := RectCollisionDecorator wrap: RectangleMorph new.
	r2 := RectCollisionDecorator wrap: RectangleMorph new.
	r1 bounds: (82@38 corner: 160@147).
	
	r2 bounds: (12@94 corner: 65@117)."left of r1"
	self deny: (r1 intersects: r2).
	self deny: (r2 intersects: r1).
	
	r2 bounds: (52@74 corner: 105@97). "cutting through left edge of r1"
	self assert: (r1 intersects: r2).
	self assert: (r2 intersects: r1).
	
	r2 bounds: (93@80 corner: 146@103). "completely inside r1"
	self assert: (r1 intersects: r2).
	self assert: (r2 intersects: r1).
	
	r2 bounds: (128@80 corner: 181@103). "cutting through right edge of r1"
	self assert: (r1 intersects: r2).
	self assert: (r2 intersects: r1).
	
	r2 bounds: (174@168 corner: 227@191). "on the right of and below r1"
	self deny: (r1 intersects: r2).
	self deny: (r2 intersects: r1).