collision type testing
differentCollisionTypesOnRectangleAndCircleWithLog: eventLog

	collider1 bounds: (50@81 corner: 120@121).
	collider2 bounds: (92@139 corner: 142@179).
	
	"collider1 openInWorld.
	collider2 openInWorld.
	self halt."
	
	collisionWorld step.
	self assert: eventLog isEmpty.
	
	
	collider2 bounds: (78@121 corner: 128@159).
	collisionWorld step.
	self assert: eventLog size equals: 1.
	self assert: (eventLog at: 1) equals: 'touch'.
	
	collider2 bounds: (99@101 corner: 137@139).
	collisionWorld step.
	self assert: eventLog size equals: 3.
	self assert: (eventLog at: 2) equals: 'touch'.
	self assert: (eventLog at: 3) equals: 'intersect'.
	
	collider2 bounds: (48@64 corner: 122@144).
	collisionWorld step.
	self assert: eventLog size equals: 5.
	self assert: (eventLog at: 4) equals: 'touch'.
	self assert: (eventLog at: 5) equals: 'intersect'.
	
	collider2 bounds: (73@97 corner: 94@112).
	collisionWorld step.
	self assert: eventLog size equals: 8.
	self assert: (eventLog at: 6) equals: 'touch'.
	self assert: (eventLog at: 7) equals: 'intersect'.
	self assert: (eventLog at: 8) equals: '2in1'.
	
	collider2 bounds: (28@44 corner: 142@164).
	collisionWorld step.
	self assert: eventLog size equals: 11.
	self assert: (eventLog at: 9) equals: 'touch'.
	self assert: (eventLog at: 10) equals: 'intersect'.
	self assert: (eventLog at: 11) equals: '1in2'.