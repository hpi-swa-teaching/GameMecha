collision type testing
differentCollisionTypesOnCirclesWithLog: eventLog
	collider1 bounds: (92@139 corner: 142@179).
	collider2 bounds: (56@81 corner: 106@121).
	
	"collider1 openInWorld.
	collider2 openInWorld.
	self halt."	
	
	collisionWorld step.
	self assert: eventLog isEmpty.
	
	collider2 bounds: (132@138 corner: 172@178).
	collisionWorld step.
	self assert: eventLog size equals: 1.
	self assert: (eventLog at: 1) equals: 'touch'.
	
	collider2 bounds: (105@155 corner: 145@195).
	collisionWorld step.
	self assert: eventLog size equals: 3.
	self assert: (eventLog at: 2) equals: 'touch'.
	self assert: (eventLog at: 3) equals: 'intersect'.
	
	collider2 bounds: (98@147 corner: 124@173).
	collisionWorld step.
	self assert: eventLog size equals: 6.
	self assert: (eventLog at: 4) equals: 'touch'.
	self assert: (eventLog at: 5) equals: 'intersect'.
	self assert: (eventLog at: 6) equals: '2in1'.
	
	collider1 bounds: collider2 bounds.
	collisionWorld step.
	self assert: eventLog size equals: 10.
	self assert: (eventLog at: 7) equals: 'touch'.
	self assert: (eventLog at: 8) equals: 'intersect'.
	self assert: (eventLog at: 9) equals: '1in2'.
	self assert: (eventLog at: 10) equals: '2in1'.