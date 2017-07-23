collision type testing
differentCollisionTypesOnRectanglesWithLog: eventLog
	collider1 bounds: (56@81 corner: 106@121).
	collider2 bounds: (92@139 corner: 142@179).
	
	"collider1 openInWorld.
	collider2 openInWorld.
	self halt.
	"
	collisionWorld step.
	self assert: eventLog isEmpty.
	
	collider2 bounds: (78@121 corner: 128@159).
	collisionWorld step.
	self assert: eventLog size equals: 1.
	self assert: (eventLog at: 1) equals: 'touch'.
	
	collider2 bounds: (75@99 corner: 125@137).
	collisionWorld step.
	self assert: eventLog size equals: 3.
	self assert: (eventLog at: 2) equals: 'touch'.
	self assert: (eventLog at: 3) equals: 'intersect'.
	
	collider2 bounds: (73@97 corner: 94@112).
	collisionWorld step.
	self assert: eventLog size equals: 6.
	self assert: (eventLog at: 4) equals: 'touch'.
	self assert: (eventLog at: 5) equals: 'intersect'.
	self assert: (eventLog at: 6) equals: '2in1'.
	
	collider2 bounds: collider1 bounds.
	collisionWorld step.
	self assert: eventLog size equals: 10.
	self assert: (eventLog at: 7) equals: 'touch'.
	self assert: (eventLog at: 8) equals: 'intersect'.
	self assert: (eventLog at: 9) equals: '1in2'.
	self assert: (eventLog at: 10) equals: '2in1'.