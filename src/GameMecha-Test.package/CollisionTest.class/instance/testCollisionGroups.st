collision groups
testCollisionGroups
	"they overlap"
	collider1 := RectangleMorph new.
	collider1 collisionBehavior: (RectangleCollisionBehavior newOn: collider1).
	collider1 bounds: (40@165 corner: 90@205).
	collider2 := RectangleMorph new.
	collider2 collisionBehavior: (RectangleCollisionBehavior newOn: collider2).
	collider2 bounds: (66@178 corner: 116@218).
	
	"todo: should we use the intersectsWith: here?"
	self assert: (collider1 intersectsWith: collider2).
	self assert: (collider2 intersectsWith: collider1).
	
	collider1 addToCollisionGroup: 'group1'.
	
	self assert: (collider1 intersectsWith: collider2).
	self assert: (collider2 intersectsWith: collider1).
	
	collider2 addToCollisionGroup: 'soLonely'.
	
	self deny: (collider1 intersectsWith: collider2).
	self deny: (collider2 intersectsWith: collider1).
	
	collider2 addToCollisionGroup: 'group1'.
	
	self assert: (collider1 intersectsWith: collider2).
	self assert: (collider2 intersectsWith: collider1).
	
	collider1 removeFromCollisionGroup: 'group1'.
	
	self assert: (collider1 intersectsWith: collider2).
	self assert: (collider2 intersectsWith: collider1).
	
	collider1 addToCollisionGroup: 'lonelyAsWell'.
	
	self deny: (collider1 intersectsWith: collider2).
	self deny: (collider2 intersectsWith: collider1).