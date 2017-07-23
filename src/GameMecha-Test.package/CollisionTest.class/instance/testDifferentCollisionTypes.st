collision type testing
testDifferentCollisionTypes
	"setting up colliders for CollisionTypeTesting"
	| eventLog |
	collider1 := CircleMorph new.
	collider1 collisionBehavior: (CircleCollisionBehavior newOn: collider1).
	collider2 := CircleMorph new.
	collider2 collisionBehavior: (CircleCollisionBehavior newOn: collider2).
	collisionWorld := PasteUpMorph new.
	collisionWorld collisionWorldBehavior: (CollisionWorldBehavior newOn: collisionWorld).
	collisionWorld addCollider: collider1.
	collisionWorld addCollider: collider2.
	eventLog := OrderedCollection new.
	collisionWorld registerCollisionWorldHandler: [:eventObject |
			self assert: (eventObject isCollider: collider1).
			self assert: (eventObject isCollider: collider2).
			
			(eventObject collidersTouch)
				ifTrue: [eventLog add: 'touch'].
			(eventObject collidersIntersect)
				ifTrue: [eventLog add: 'intersect'].
			(eventObject containsTheOtherCollider: collider1)
				ifTrue: [eventLog add: '1in2'].
			(eventObject containsTheOtherCollider: collider2)
				ifTrue: [eventLog add: '2in1']].
	self differentCollisionTypesOnCirclesWithLog: eventLog.
	
	collider1 := RectangleMorph new.
	collider1 collisionBehavior: (RectangleCollisionBehavior newOn: collider1).
	eventLog removeAll.
	collisionWorld removeColliders.
	collisionWorld addCollider: collider1.
	collisionWorld addCollider: collider2.
	collisionWorld collisionWorldHandler: [:eventObject |
			self assert: (eventObject isCollider: collider1).
			self assert: (eventObject isCollider: collider2).
			
			(eventObject collidersTouch)
				ifTrue: [eventLog add: 'touch'].
			(eventObject collidersIntersect)
				ifTrue: [eventLog add: 'intersect'].
			(eventObject containsTheOtherCollider: collider1)
				ifTrue: [eventLog add: '1in2'].
			(eventObject containsTheOtherCollider: collider2)
				ifTrue: [eventLog add: '2in1']].
	self differentCollisionTypesOnRectangleAndCircleWithLog: eventLog.

	collider2 := RectangleMorph new.
	collider2 collisionBehavior: (RectangleCollisionBehavior newOn: collider2).
	eventLog removeAll.
	collisionWorld removeColliders.
	collisionWorld addCollider: collider1.
	collisionWorld addCollider: collider2.
	collisionWorld collisionWorldHandler: [:eventObject |
			self assert: (eventObject isCollider: collider1).
			self assert: (eventObject isCollider: collider2).
			
			(eventObject collidersTouch)
				ifTrue: [eventLog add: 'touch'].
			(eventObject collidersIntersect)
				ifTrue: [eventLog add: 'intersect'].
			(eventObject containsTheOtherCollider: collider1)
				ifTrue: [eventLog add: '1in2'].
			(eventObject containsTheOtherCollider: collider2)
				ifTrue: [eventLog add: '2in1']].
			
	self differentCollisionTypesOnRectanglesWithLog: eventLog.