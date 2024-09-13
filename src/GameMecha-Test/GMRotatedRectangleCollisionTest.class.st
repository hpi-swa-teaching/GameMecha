"
This test tests collision between two rotated rectangles, a rotated rectangle and a circle, as well as between a rotated rectangle and an axis aligned rectangle.
"
Class {
	#name : #GMRotatedRectangleCollisionTest,
	#superclass : #GMCollisionShapeTest,
	#instVars : [
		'circle',
		'rectangle',
		'rotatedRectangleShell',
		'rotatedRectangleTallShell',
		'scaledRotatedRectangleShell'
	],
	#category : #'GameMecha-Test',
	#'squeak_changestamp' : 'NK 7/24/2018 15:08'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'AZ 5/25/2018 11:07'
}
GMRotatedRectangleCollisionTest class >> circleDiameter [
	^ 50 @ 50
]

{
	#category : #constants,
	#'squeak_changestamp' : 'AZ 5/29/2018 21:37'
}
GMRotatedRectangleCollisionTest class >> circleOffsetCollision [
	^ 15 @ -120
]

{
	#category : #constants,
	#'squeak_changestamp' : 'AZ 5/29/2018 21:38'
}
GMRotatedRectangleCollisionTest class >> circleOffsetNoCollision [
	^ 22 @ -120
]

{
	#category : #constants,
	#'squeak_changestamp' : 'brh 5/22/2018 21:30'
}
GMRotatedRectangleCollisionTest class >> rectangleExtent [
	^ 50 @ 50
]

{
	#category : #constants,
	#'squeak_changestamp' : 'AZ 5/29/2018 21:43'
}
GMRotatedRectangleCollisionTest class >> rectangleOffsetCollision [
	^ 40 @ -110
]

{
	#category : #constants,
	#'squeak_changestamp' : 'AZ 5/29/2018 21:43'
}
GMRotatedRectangleCollisionTest class >> rectangleOffsetNoCollision [
	^ 45 @ -115
]

{
	#category : #constants,
	#'squeak_changestamp' : 'AZ 5/25/2018 10:55'
}
GMRotatedRectangleCollisionTest class >> rotatedRectangleAngle [
	^ Float pi / 4
]

{
	#category : #constants,
	#'squeak_changestamp' : 'AZ 5/25/2018 11:01'
}
GMRotatedRectangleCollisionTest class >> rotatedRectangleExtent [
	^ 150 @ 100
]

{
	#category : #constants,
	#'squeak_changestamp' : 'AZ 5/25/2018 11:24'
}
GMRotatedRectangleCollisionTest class >> rotatedRectangleTallAngle [
	^ Float pi / 8 
]

{
	#category : #constants,
	#'squeak_changestamp' : 'AZ 5/25/2018 11:20'
}
GMRotatedRectangleCollisionTest class >> rotatedRectangleTallExtent [
	^ 300 @ 50
]

{
	#category : #constants,
	#'squeak_changestamp' : 'AZ 5/29/2018 21:49'
}
GMRotatedRectangleCollisionTest class >> rotatedRectangleTallOffsetCollision [
	^ -50 @ -225
]

{
	#category : #constants,
	#'squeak_changestamp' : 'AZ 5/29/2018 21:51'
}
GMRotatedRectangleCollisionTest class >> rotatedRectangleTallOffsetNoCollision [
	^ -50 @ -232
]

{
	#category : #constants,
	#'squeak_changestamp' : 'AZ 5/28/2018 17:41'
}
GMRotatedRectangleCollisionTest class >> scaledRotatedRectangleScale [
	^ 2
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TP 7/10/2018 16:23'
}
GMRotatedRectangleCollisionTest >> circle [
	^ circle ifNil: [circle := CircleMorph new
		extent: self class circleDiameter;
		center: 0 @ 0;
		gmCollisionDetectionStrategy: GMCircleCollisionDetectionShape new;
		yourself]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 5/25/2018 10:35'
}
GMRotatedRectangleCollisionTest >> circle: anObject [
	circle := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 5/29/2018 19:33'
}
GMRotatedRectangleCollisionTest >> newMorphWithOwner [
	"necessary, because TransformationMorph expects an owner"
	| ownedMorph |
	ownedMorph := Morph new.
	Morph new addMorph: ownedMorph.
	^ ownedMorph 
]

{
	#category : #testing,
	#'squeak_changestamp' : 'brh 7/24/2018 19:03'
}
GMRotatedRectangleCollisionTest >> newShellWithExtent: anExtent [
	^ self newMorphWithOwner
		extent: anExtent;
		center: 0 @ 0;
		addFlexShell;
		owner
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TP 7/10/2018 16:23'
}
GMRotatedRectangleCollisionTest >> rectangle [
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
GMRotatedRectangleCollisionTest >> rectangle: anObject [
	rectangle := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 7/24/2018 19:06'
}
GMRotatedRectangleCollisionTest >> rotatedRectangleShell [
	^ rotatedRectangleShell ifNil: [rotatedRectangleShell := 
		(self newShellWithExtent: self class rotatedRectangleExtent)
			gmCollisionDetectionStrategy: self strategy;
			angle: self class rotatedRectangleAngle;
			yourself]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 5/25/2018 10:46'
}
GMRotatedRectangleCollisionTest >> rotatedRectangleShell: anObject [
	rotatedRectangleShell := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 7/24/2018 19:06'
}
GMRotatedRectangleCollisionTest >> rotatedRectangleTallShell [
	^ rotatedRectangleTallShell ifNil: [rotatedRectangleTallShell := 
		(self newShellWithExtent: self class rotatedRectangleTallExtent)
			gmCollisionDetectionStrategy: self strategy;
			angle: self class rotatedRectangleTallAngle;
			yourself]
			 
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 5/25/2018 10:46'
}
GMRotatedRectangleCollisionTest >> rotatedRectangleTallShell: anObject [
	rotatedRectangleTallShell := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 7/24/2018 20:58'
}
GMRotatedRectangleCollisionTest >> scaledRotatedRectangleShell [
	^ scaledRotatedRectangleShell ifNil: [scaledRotatedRectangleShell := 
		(self newShellWithExtent: self class rotatedRectangleExtent / self class scaledRotatedRectangleScale)
			gmCollisionDetectionStrategy: self strategy;
			angle: self class rotatedRectangleAngle;
			scale: self class scaledRotatedRectangleScale;
			yourself]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 5/28/2018 17:39'
}
GMRotatedRectangleCollisionTest >> scaledRotatedRectangleShell: anObject [
	scaledRotatedRectangleShell := anObject
]

{
	#category : #running,
	#'squeak_changestamp' : 'brh 6/11/2018 18:07'
}
GMRotatedRectangleCollisionTest >> setUp [
	self collisionHandler addCollisionMorphs: {self circle. self rectangle}.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 7/15/2018 14:43'
}
GMRotatedRectangleCollisionTest >> strategy [
	^ GMRotatedRectangleCollisionDetectionShape new
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'AZ 5/29/2018 21:34'
}
GMRotatedRectangleCollisionTest >> testRotatedRectangleCircleCollision [
	self assertCollision: self rotatedRectangleShell with: self circle andOffset: self class circleOffsetCollision.
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'AZ 5/29/2018 21:36'
}
GMRotatedRectangleCollisionTest >> testRotatedRectangleCircleNoCollision [
	self denyCollision: self rotatedRectangleShell with: self circle andOffset: self class circleOffsetNoCollision.
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'AZ 5/29/2018 21:40'
}
GMRotatedRectangleCollisionTest >> testRotatedRectangleRectangleCollision [
	self assertCollision: self rotatedRectangleShell with: self rectangle andOffset: self class rectangleOffsetCollision.
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'AZ 5/29/2018 21:44'
}
GMRotatedRectangleCollisionTest >> testRotatedRectangleRectangleNoCollision [
	self denyCollision: self rotatedRectangleShell with: self rectangle andOffset: self class rectangleOffsetNoCollision.
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'brh 7/24/2018 20:56'
}
GMRotatedRectangleCollisionTest >> testRotatedRectangleRotatedRectangleCollision [
	self assertCollision: self rotatedRectangleShell 
		with: self rotatedRectangleTallShell 
		andOffset: self class rotatedRectangleTallOffsetCollision.
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'brh 7/24/2018 20:56'
}
GMRotatedRectangleCollisionTest >> testRotatedRectangleRotatedRectangleNoCollision [
	self denyCollision: self rotatedRectangleShell 
		with: self rotatedRectangleTallShell 
		andOffset: self class rotatedRectangleTallOffsetNoCollision.
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'AZ 5/29/2018 21:38'
}
GMRotatedRectangleCollisionTest >> testScaledRotatedRectangleCircleCollision [
	self assertCollision: self scaledRotatedRectangleShell with: self circle andOffset: self class circleOffsetCollision.
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'AZ 5/29/2018 21:39'
}
GMRotatedRectangleCollisionTest >> testScaledRotatedRectangleCircleNoCollision [
	self denyCollision: self scaledRotatedRectangleShell with: self circle andOffset: self class circleOffsetNoCollision.
]
