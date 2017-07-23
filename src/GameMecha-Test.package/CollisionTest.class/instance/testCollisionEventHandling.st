morph
testCollisionEventHandling
	| collisionCounter |
	collisionWorld := PasteUpMorph new.
	collisionWorld collisionWorldBehavior: (CollisionWorldBehavior newOn: collisionWorld).
	collisionCounter := 0.
	collisionWorld registerCollisionWorldHandler: [:collisionEvent | collisionCounter := collisionCounter + 1].
	collider1 := CircleMorph new.
	collider1 collisionBehavior: (CircleCollisionBehavior newOn: collider1).
	collider2 := RectangleMorph new.
	collider2 collisionBehavior: (RectangleCollisionBehavior newOn: collider2).
	collisionWorld addCollider: collider1.
	collisionWorld addCollider: collider2.
	
	"maybe refactor other tests to work here as well"
	collider1 bounds: (100@100 corner: 200@200).
	collider2 bounds: (95@45 corner: 120@120).
	collisionWorld step.
	self assert: collisionCounter equals: 1. "rectangle with one edge in circle"
	
	collider2 bounds: (50@75 corner: 76@100).
	collisionWorld step.
	self assert: collisionCounter equals: 1. "rectangle away of circle"
	
	collider2 bounds: (110@110 corner: 180@180).
     	collisionWorld step.
	self assert: collisionCounter equals: 2. "rectangle moved into circle"
	
	collider2 bounds: (120@120 corner: 170@170).
	collisionWorld step.
      self assert: collisionCounter equals: 3. "rectangle still in circle"

	"now add a new Handler, to see if both get executed"
	collisionWorld registerCollisionWorldHandler: [:collisionEvent | collisionCounter := collisionCounter + 38].
	collisionWorld step.
	self assert: collisionCounter equals: 42.