collision type testing
testDifferentCollisionTypesWithRectangleAndCircle
	|rectangle circle world eventLog sizeTest |
	eventLog := OrderedCollection new.
	self collider1: (RectangleCollider wrap: RectangleMorph new).
	self collider2: (CircleCollider wrap: CircleMorph new).
	world := CollisionWorld new.
	rectangle := self collider1. 
	circle := self collider2.
	
	world addCollider: rectangle.
	world addCollider: circle.
	
	rectangle bounds: (50@81 corner: 120@121).
	circle bounds: (92@139 corner: 142@179).
	
	"rectangle openInWorld.
	circle openInWorld.
	self halt."
	
	
	world registerCollisionHandler: [:eventObject |
			self assert: (eventObject isCollider: rectangle).
			self assert: (eventObject isCollider: circle).
			
			(eventObject collidersTouch)
				ifTrue: [eventLog add: 'touch'].
			(eventObject collidersIntersect)
				ifTrue: [eventLog add: 'intersect'].
			(eventObject containsTheOtherCollider: rectangle)
				ifTrue: [eventLog add: '1in2'].
			(eventObject containsTheOtherCollider: circle)
				ifTrue: [eventLog add: '2in1'].
		].
	world step.
	self assert: eventLog isEmpty.
	
	sizeTest :=1.
	circle bounds: (78@121 corner: 128@159).
	world step.
	self assert: eventLog size equals: sizeTest.
	self assert: (eventLog at: 1) equals: 'touch'.
	
	sizeTest := sizeTest + 2.
	circle bounds: (99@101 corner: 137@139).
	world step.
	self assert: eventLog size equals: sizeTest.
	self assert: (eventLog at: 2) equals: 'touch'.
	self assert: (eventLog at: 3) equals: 'intersect'.
	
	sizeTest := sizeTest + 2.
	
	circle bounds: (48@64 corner: 122@144).
	world step.
	self assert: eventLog size equals: sizeTest.
	self assert: (eventLog at: 4) equals: 'touch'.
	self assert: (eventLog at: 5) equals: 'intersect'.
	
	sizeTest := sizeTest + 3.
	circle bounds: (73@97 corner: 94@112).
	world step.
	self assert: eventLog size equals: sizeTest.
	self assert: (eventLog at: 6) equals: 'touch'.
	self assert: (eventLog at: 7) equals: 'intersect'.
	self assert: (eventLog at: 8) equals: '2in1'.
	
	sizeTest := sizeTest + 3.
	circle bounds: (28@44 corner: 142@164).
	world step.
	self assert: eventLog size equals: sizeTest.
	self assert: (eventLog at: 9) equals: 'touch'.
	self assert: (eventLog at: 10) equals: 'intersect'.
	self assert: (eventLog at: 11) equals: '1in2'.