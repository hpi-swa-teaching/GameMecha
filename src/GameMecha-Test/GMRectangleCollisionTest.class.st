"
This test tests collision between two axis aligned rectangles.
"
Class {
	#name : #GMRectangleCollisionTest,
	#superclass : #GMCollisionShapeTest,
	#instVars : [
		'smallRectangle',
		'bigRectangle'
	],
	#category : #'GameMecha-Test',
	#'squeak_changestamp' : 'NK 7/24/2018 15:07'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'AZ 5/29/2018 20:34'
}
GMRectangleCollisionTest class >> bigRectangleExtent [
	^ 200 @ 100
]

{
	#category : #constants,
	#'squeak_changestamp' : 'AZ 5/29/2018 20:34'
}
GMRectangleCollisionTest class >> smallRectangleExtent [
	^ 50 @ 50
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 7/15/2018 14:43'
}
GMRectangleCollisionTest >> bigRectangle [
	^ bigRectangle ifNil: 
		[bigRectangle := Morph new
			extent: self class bigRectangleExtent;
			gmCollisionDetectionStrategy: self strategy;
			position: 0 @ 0;
			yourself]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 5/29/2018 20:31'
}
GMRectangleCollisionTest >> bigRectangle: anObject [
	bigRectangle := anObject
]

{
	#category : #running,
	#'squeak_changestamp' : 'brh 6/11/2018 18:07'
}
GMRectangleCollisionTest >> setUp [
	self collisionHandler addCollisionMorphs: {self bigRectangle. self smallRectangle}.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 7/15/2018 14:43'
}
GMRectangleCollisionTest >> smallRectangle [
	^ smallRectangle ifNil: 
		[smallRectangle := Morph new
			extent: self class smallRectangleExtent;
			gmCollisionDetectionStrategy: self strategy;
			yourself]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 5/29/2018 20:32'
}
GMRectangleCollisionTest >> smallRectangle: anObject [
	smallRectangle := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 7/15/2018 14:42'
}
GMRectangleCollisionTest >> strategy [
	^ GMRectangleCollisionDetectionShape new
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'AZ 5/29/2018 20:32'
}
GMRectangleCollisionTest >> testRectangleRectangleCollision [
	self assertCollision: self smallRectangle with: self bigRectangle andOffset: 0 @ 0.
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'AZ 5/29/2018 20:33'
}
GMRectangleCollisionTest >> testRectangleRectangleInCollisionCollection [
	self bigRectangle position: self smallRectangle position.
	self 
		assert: [(self collisionHandler morphsCollidingWith: self smallRectangle) includes: self bigRectangle];
		assert: [(self collisionHandler morphsCollidingWith: self bigRectangle) includes: self smallRectangle].
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'AZ 5/29/2018 20:36'
}
GMRectangleCollisionTest >> testRectangleRectangleNoCollision [
	self denyCollision: self smallRectangle with: self bigRectangle andOffset: self bigRectangle extent.
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'brh 6/11/2018 17:41'
}
GMRectangleCollisionTest >> testRectangleRectangleNotInCollisionCollection [
	self smallRectangle position: self bigRectangle position + self bigRectangle extent.
	self 
		deny: [(self collisionHandler morphsCollidingWith: self smallRectangle) includes: self bigRectangle];
		deny: [(self collisionHandler morphsCollidingWith: self bigRectangle) includes: self smallRectangle].
]
