morph
testCollisionEventHandling
	
	| world collisionCounter circle rectangle circleDecorator rectangleDecorator |
	world := CollisionWorld new.
	collisionCounter := 0.
	world registerCollisionHandler: [:collisionEvent | collisionCounter add: 1].
	circle := CircleMorph new.
	circleDecorator := CircleCollisionDecorator wrap: circle.
	rectangle := RectangleMorph  new.
	rectangleDecorator := RectangleCollisionDecorator wrap: rectangle.
	world addCollider: circleDecorator.
	world addCollider: rectangleDecorator.
	
	"maybe refactor other tests to work here as well"
	circle bounds: (100@100 corner: 200@200).
	rectangle bounds: (75@75 corner: 100@150).
	world step.
	self assert: collisionCounter equals: 1. "rectangle with one edge in circle"
	
	rectangle bounds: (50@75 corner: 76@100).
	world step.
	self assert: collisionCounter equals: 1. "rectangle away of circle"
	
     rectangle bounds: (110@110 corner: 180@180).
     world step.
	self assert: collisionCounter equals: 2. "rectangle moved into circle"
	
	rectangle bounds: (120@120 corner: 170@170).
	world step.
      self assert: collisionCounter equals: 2. "rectangle still in circle"
	