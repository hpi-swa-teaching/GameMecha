"
This test includes basic tests for the collision detection of GM. This includes basic functionalities like adding a GMCollisionHandler or a specific collision shape to a morph.

"
Class {
	#name : #GMCollisionHandlerTest,
	#superclass : #TestCase,
	#instVars : [
		'collisionHandler',
		'collisionMorph'
	],
	#category : #'GameMecha-Test',
	#'squeak_changestamp' : 'NK 7/25/2018 17:25'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 5/22/2018 15:50'
}
GMCollisionHandlerTest >> collisionHandler [
	^ collisionHandler ifNil: [collisionHandler := GMCollisionHandler new]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 5/15/2018 19:53'
}
GMCollisionHandlerTest >> collisionHandler: anObject [
	collisionHandler := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 7/15/2018 18:07'
}
GMCollisionHandlerTest >> collisionMorph [
	^ collisionMorph ifNil: [collisionMorph := Morph new]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 7/15/2018 18:07'
}
GMCollisionHandlerTest >> collisionMorph: anObject [
	collisionMorph := anObject
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'AZ 7/15/2018 18:07'
}
GMCollisionHandlerTest >> testAddAndRemove [
	self collisionHandler removeAllMorphs.
	self deny: [self collisionHandler includes: self collisionMorph].
	self collisionHandler addCollisionMorph: self collisionMorph.
	self assert: [self collisionHandler includes: self collisionMorph].
	self collisionHandler removeCollisionMorph: self collisionMorph.
	self deny: [self collisionHandler includes: self collisionMorph].
	
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'NK 7/23/2018 13:20'
}
GMCollisionHandlerTest >> testAssigningCollisionDetectionStrategy [
	| aCollisionDetectionStrategy aMorph |
	aMorph := Morph new.
	aCollisionDetectionStrategy := GMRectangleCollisionDetectionShape new.
	self assert: [aMorph gmCollisionDetectionShape isNil].
	aMorph gmCollisionDetectionStrategy: aCollisionDetectionStrategy.
	self 
		assert: [aMorph gmCollisionDetectionShape == aCollisionDetectionStrategy];
		assert: [aMorph gmCollisionDetectionShape owner == aMorph].
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'AZ 7/15/2018 18:07'
}
GMCollisionHandlerTest >> testRemoveAll [
	self collisionHandler addCollisionMorph: self collisionMorph.
	self assert: [self collisionHandler includes: self collisionMorph].
	self collisionHandler removeAllMorphs.
	self deny: [self collisionHandler includes: self collisionMorph].
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'AZ 6/12/2018 21:44'
}
GMCollisionHandlerTest >> testRemoveMorphNotIncluded [
	self should: [self collisionHandler removeCollisionMorph: Morph new] raise: Error.
]
