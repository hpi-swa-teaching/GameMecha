collision type testing
testDifferentCollisionTypesOnRectangles
	|rectangle1 rectangle2 world eventLog|
	eventLog := OrderedCollection new.
	self collider1: (RectangleCollider wrap: RectangleMorph new).
	self collider2: (RectangleCollider wrap: RectangleMorph new).
	world := CollisionWorld new.
	rectangle1 := self collider1.
	rectangle2 := self collider2.
	
	world addCollider: rectangle1.
	world addCollider: rectangle2.
	
	rectangle1 bounds: (56@81 corner: 106@121).
	rectangle2 bounds: (92@139 corner: 142@179).
	
	"rectangle1 openInWorld.
	rectangle2 openInWorld.
	self halt.
	"
	
	world registerCollisionHandler: [:eventObject |
			self assert: (eventObject isCollider: rectangle1).
			self assert: (eventObject isCollider: rectangle2).
			
			(eventObject collidersTouch)
				ifTrue: [eventLog add: 'touch'].
			(eventObject collidersIntersect)
				ifTrue: [eventLog add: 'intersect'].
			(eventObject containsTheOtherCollider: rectangle1)
				ifTrue: [eventLog add: '1in2'].
			(eventObject containsTheOtherCollider: rectangle2)
				ifTrue: [eventLog add: '2in1'].
		].
	world step.
	self assert: eventLog isEmpty.
	
	rectangle2 bounds: (78@121 corner: 128@159).
	world step.
	self assert: eventLog size equals: 1.
	self assert: (eventLog at: 1) equals: 'touch'.
	
	rectangle2 bounds: (75@99 corner: 125@137).
	world step.
	self assert: eventLog size equals: 3.
	self assert: (eventLog at: 2) equals: 'touch'.
	self assert: (eventLog at: 3) equals: 'intersect'.
	
	rectangle2 bounds: (73@97 corner: 94@112).
	world step.
	self assert: eventLog size equals: 6.
	self assert: (eventLog at: 4) equals: 'touch'.
	self assert: (eventLog at: 5) equals: 'intersect'.
	self assert: (eventLog at: 6) equals: '2in1'.
	
	rectangle2 bounds: rectangle1 bounds.
	world step.
	self assert: eventLog size equals: 10.
	self assert: (eventLog at: 7) equals: 'touch'.
	self assert: (eventLog at: 8) equals: 'intersect'.
	self assert: (eventLog at: 9) equals: '1in2'.
	self assert: (eventLog at: 10) equals: '2in1'.
	
	
	
	