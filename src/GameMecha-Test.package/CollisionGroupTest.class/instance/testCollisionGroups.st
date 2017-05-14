as yet unclassified
testCollisionGroups
	|object1 object2|
	"they overlap"
	object1 := RectangleCollisionDecorator wrap: RectangleMorph new.
	object1 bounds: (40@165 corner: 90@205).
	object2 := RectangleCollisionDecorator wrap: RectangleMorph new.
	object2 bounds: (66@178 corner: 116@218).
	
	"todo: should we use the intersects: here?"
	self assert: (object1 intersects: object2).
	self assert: (object2 intersects: object1).
	
	object1 addToCollisionGroup: 'group1'.
	
	self assert: (object1 intersects: object2).
	self assert: (object2 intersects: object1).
	
	object2 addToCollisionGroup: 'soLonely'.
	
	self deny: (object1 intersects: object2).
	self deny: (object2 intersects: object1).
	
	object2 addToCollisionGroup: 'group1'.
	
	self assert: (object1 intersects: object2).
	self assert: (object2 intersects: object1).
	
	object1 removeFromCollisionGroup: 'group1'.
	
	self assert: (object1 intersects: object2).
	self assert: (object2 intersects: object1).
	
	object1 addToCollisionGroup: 'lonelyAsWell'.
	
	self deny: (object1 intersects: object2).
	self deny: (object2 intersects: object1).
	
	
	