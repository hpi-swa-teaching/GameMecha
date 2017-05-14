morph
testCollisionEventHandling
	
	| world collisionCounter circleDecorator rectangleDecorator |
	world := CollisionWorld new.
	collisionCounter := 0.
	world registerCollisionHandler: [:collisionEvent | collisionCounter := collisionCounter + 1].
	circleDecorator := CircleCollisionDecorator wrap: CircleMorph new.
	rectangleDecorator := RectangleCollisionDecorator wrap: RectangleMorph  new.
	world addCollider: circleDecorator.
	world addCollider: rectangleDecorator.
	
	"maybe refactor other tests to work here as well"
	circleDecorator bounds: (100@100 corner: 200@200).
	rectangleDecorator bounds: (95@45 corner: 120@120).
	world step.
	self assert: collisionCounter equals: 1. "rectangle with one edge in circle"
	
	rectangleDecorator bounds: (50@75 corner: 76@100).
	world step.
	self assert: collisionCounter equals: 1. "rectangle away of circle"
	
	rectangleDecorator bounds: (110@110 corner: 180@180).
     	world step.
	self assert: collisionCounter equals: 2. "rectangle moved into circle"
	
	rectangleDecorator bounds: (120@120 corner: 170@170).
	world step.
      self assert: collisionCounter equals: 3. "rectangle still in circle"

	"now add a new Handler, to see if both get executed"
	world registerCollisionHandler: [:collisionEvent | collisionCounter := collisionCounter + 38].
	world step.
	self assert: collisionCounter equals: 42.
	