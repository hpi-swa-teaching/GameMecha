"
This test tests collision detection between two circles as well a circle and an axis aligned rectangle.
"
Class {
	#name : #GMCircleCollisionTest,
	#superclass : #GMCollisionShapeTest,
	#instVars : [
		'smallCircle',
		'bigCircle',
		'rectangle'
	],
	#category : #'GameMecha-Test',
	#'squeak_changestamp' : 'NK 7/24/2018 15:07'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'brh 5/22/2018 21:29'
}
GMCircleCollisionTest class >> bigCircleDiameter [
	^ 100 @ 100
]

{
	#category : #constants,
	#'squeak_changestamp' : 'AZ 7/16/2018 12:36'
}
GMCircleCollisionTest class >> circleEdgeNoCollisionOffset [
	^ self circleEdgeOffset + (3 @ 3)
]

{
	#category : #constants,
	#'squeak_changestamp' : 'AZ 7/16/2018 12:36'
}
GMCircleCollisionTest class >> circleEdgeOffset [
	^ 16 @ 16
]

{
	#category : #constants,
	#'squeak_changestamp' : 'brh 5/22/2018 21:30'
}
GMCircleCollisionTest class >> rectangleExtent [
	^ 50 @ 50
]

{
	#category : #constants,
	#'squeak_changestamp' : 'brh 5/22/2018 21:29'
}
GMCircleCollisionTest class >> smallCircleDiameter [
	^ 50 @ 50
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 7/15/2018 14:41'
}
GMCircleCollisionTest >> bigCircle [
	^ bigCircle ifNil: [bigCircle := CircleMorph new
		extent: self class bigCircleDiameter;
		center: 0 @ 0;
		gmCollisionDetectionStrategy: self strategy;
		yourself]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 5/22/2018 16:12'
}
GMCircleCollisionTest >> bigCircle: anObject [
	bigCircle := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TP 7/10/2018 16:23'
}
GMCircleCollisionTest >> rectangle [
	^ rectangle ifNil: [rectangle := Morph new
		extent: self class rectangleExtent;
		position: 0 @ 0;
		gmCollisionDetectionStrategy: GMRectangleCollisionDetectionShape new;
		yourself]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 5/22/2018 16:12'
}
GMCircleCollisionTest >> rectangle: anObject [
	rectangle := anObject
]

{
	#category : #running,
	#'squeak_changestamp' : 'brh 6/11/2018 18:08'
}
GMCircleCollisionTest >> setUp [
	self collisionHandler addCollisionMorphs: {self bigCircle. self smallCircle. self rectangle}.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 7/15/2018 14:41'
}
GMCircleCollisionTest >> smallCircle [
	^ smallCircle ifNil: [smallCircle := CircleMorph new
		extent: self class smallCircleDiameter;
		gmCollisionDetectionStrategy: self strategy;
		yourself]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 5/22/2018 16:12'
}
GMCircleCollisionTest >> smallCircle: anObject [
	smallCircle := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 7/15/2018 14:40'
}
GMCircleCollisionTest >> strategy [
	^ GMCircleCollisionDetectionShape new
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'NK 7/23/2018 13:49'
}
GMCircleCollisionTest >> testCircleCircleCollision [
	self assertCollision: self smallCircle with: self bigCircle andOffset: 0 @ 0.
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'AZ 5/29/2018 20:50'
}
GMCircleCollisionTest >> testCircleCircleNoCollision [
	self denyCollision: self smallCircle with: self bigCircle andOffset: (self smallCircle extent - (1 @ 1)).
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'brh 6/11/2018 17:33'
}
GMCircleCollisionTest >> testCircleRectangleCollision [
	self assertCollision: self smallCircle with: self rectangle andOffset: 0 @ 0.
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'AZ 7/16/2018 12:37'
}
GMCircleCollisionTest >> testCircleRectangleEdgeCollision [
	self assertCollision: self rectangle with: self smallCircle andOffset: self class circleEdgeOffset.
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'AZ 7/16/2018 12:36'
}
GMCircleCollisionTest >> testCircleRectangleEdgeNoCollision [
	self denyCollision: self rectangle with: self smallCircle andOffset: self class circleEdgeNoCollisionOffset.
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'AZ 5/29/2018 20:53'
}
GMCircleCollisionTest >> testCircleRectangleNoCollision [
	self denyCollision: self smallCircle with: self rectangle andOffset: self smallCircle extent.
]
