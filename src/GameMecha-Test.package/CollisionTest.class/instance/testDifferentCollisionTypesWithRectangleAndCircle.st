collision type testing
testDifferentCollisionTypesWithRectangleAndCircle
	|rectangle circle world eventLog|
	eventLog := OrderedCollection new.
	self collider1: (RectangleCollider wrap: RectangleMorph new).
	self collider2: (CircleCollider wrap: CircleMorph new).
	world := CollisionWorld new.
	rectangle := self collider1. 
	circle := self collider2.
	
	world addCollider: rectangle.
	world addCollider: circle.
	
	rectangle bounds: (56@81 corner: 106@121).
	circle bounds: (92@139 corner: 142@179).
	
	rectangle openInWorld.
	circle openInWorld.
	"self halt."
	
	world registerCollisionHandler: [:eventObject |
			self assert: (eventObject isCollider: rectangle).
			self assert: (eventObject isCollider: circle).
			
			(eventObject collidersTouch)
				ifTrue: [eventLog add: 'touch'].
			(eventObject collidersIntersect)
				ifTrue: [eventLog add: 'intersect'].
			(eventObject containsTheOtherCollider: rectangle)
				ifTrue: [eventLog add: '2in1'].
			(eventObject containsTheOtherCollider: circle)
				ifTrue: [eventLog add: '1in2'].
		].
	world step.
	self assert: eventLog isEmpty.
	
	circle bounds: (78@121 corner: 128@159).
	world step.
	self assert: eventLog size equals: 1.
	self assert: (eventLog at: 1) equals: 'touch'.
	
	circle bounds: (75@99 corner: 125@137).
	world step.
	self assert: eventLog size equals: 3.
	self assert: (eventLog at: 2) equals: 'touch'.
	self assert: (eventLog at: 3) equals: 'intersect'.
	
	circle bounds: (73@97 corner: 94@112).
	world step.
	self assert: eventLog size equals: 6.
	self assert: (eventLog at: 4) equals: 'touch'.
	self assert: (eventLog at: 5) equals: 'intersect'.
	self assert: (eventLog at: 6) equals: '2in1'.
	
	circle bounds: rectangle bounds.
	world step.
	self assert: eventLog size equals: 10.
	self assert: (eventLog at: 7) equals: 'touch'.
	self assert: (eventLog at: 8) equals: 'intersect'.
	self assert: (eventLog at: 9) equals: '2in1'.
	self assert: (eventLog at: 10) equals: '1in2'.