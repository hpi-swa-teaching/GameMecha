collision type testing
testDifferentCollisionTypesOnCircles
	|circle1 circle2 world eventLog|
	eventLog := OrderedCollection new.
	self collider1: (CircleCollider wrap: CircleMorph new).
	self collider2:  (CircleCollider wrap: CircleMorph new).
	world := CollisionWorld new.
	circle1 := self collider1.
	circle2 := self collider2.
	
	world addCollider: circle1.
	world addCollider: circle2.
	
	circle1 bounds: (92@139 corner: 142@179).
	circle2 bounds: (56@81 corner: 106@121).
	
	"circle1 openInWorld.
	circle2 openInWorld.
	self halt."	
	
	world registerCollisionHandler: [:eventObject |
			self assert: (eventObject isCollider: circle1).
			self assert: (eventObject isCollider: circle2).
			
			(eventObject collidersTouch)
				ifTrue: [eventLog add: 'touch'].
			(eventObject collidersIntersect)
				ifTrue: [eventLog add: 'intersect'].
			(eventObject containsTheOtherCollider: circle1)
				ifTrue: [eventLog add: '2in1'].
			(eventObject containsTheOtherCollider: circle2)
				ifTrue: [eventLog add: '1in2'].
		].
	world step.
	self assert: eventLog isEmpty.
	
	circle2 bounds: (132@138 corner: 172@178).
	world step.
	self assert: eventLog size equals: 1.
	self assert: (eventLog at: 1) equals: 'touch'.
	
	circle2 bounds: (105@155 corner: 145@195).
	world step.
	self assert: eventLog size equals: 3.
	self assert: (eventLog at: 2) equals: 'touch'.
	self assert: (eventLog at: 3) equals: 'intersect'.
	
	circle2 bounds: (98@147 corner: 124@173).
	world step.
	self assert: eventLog size equals: 6.
	self assert: (eventLog at: 4) equals: 'touch'.
	self assert: (eventLog at: 5) equals: 'intersect'.
	self assert: (eventLog at: 6) equals: '2in1'.
	
	circle1 bounds: circle2 bounds.
	world step.
	self assert: eventLog size equals: 10.
	self assert: (eventLog at: 7) equals: 'touch'.
	self assert: (eventLog at: 8) equals: 'intersect'.
	self assert: (eventLog at: 9) equals: '2in1'.
	self assert: (eventLog at: 10) equals: '1in2'.