"
A GMCollisionHandler checks for collision partners of a specific morph on request. 
""morphsCollidingWith: aMorph"" will return all registered morphs colliding with said morph. Morphs can be registered by ""addMorph: aMorph"" and thus will be considered in future collision checks. 
The CollisionHandler expects each morph to have a CollisionDetectionStrategy. 
The method ""is: aMorph collidingWith: anotherMorph"" provides a way to check whether two specific morphs are colliding with each other.
"
Class {
	#name : #GMCollisionHandler,
	#superclass : #Object,
	#instVars : [
		'collisionMorphs'
	],
	#category : #'GameMecha-Collisions',
	#'squeak_changestamp' : 'NK 7/24/2018 15:29'
}

{
	#category : #'collision morphs',
	#'squeak_changestamp' : 'brh 6/10/2018 16:13'
}
GMCollisionHandler >> addCollisionMorph: aMorph [
	self collisionMorphs add: aMorph.
]

{
	#category : #'collision morphs',
	#'squeak_changestamp' : 'AZ 6/12/2018 21:44'
}
GMCollisionHandler >> addCollisionMorphs: aCollection [
	self collisionMorphs addAll: aCollection.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 5/15/2018 20:05'
}
GMCollisionHandler >> collisionMorphs [
	^ collisionMorphs ifNil: [collisionMorphs := OrderedCollection new]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 5/15/2018 20:03'
}
GMCollisionHandler >> collisionMorphs: anObject [
	collisionMorphs := anObject
]

{
	#category : #'collision morphs',
	#'squeak_changestamp' : 'brh 5/20/2018 12:12'
}
GMCollisionHandler >> includes: aMorph [
	^ self collisionMorphs includes: aMorph
]

{
	#category : #'collision detection',
	#'squeak_changestamp' : 'TP 7/10/2018 16:46'
}
GMCollisionHandler >> is: aMorph collidingWith: anotherMorph [
	^ (aMorph bounds intersects: anotherMorph bounds)
		and: [aMorph gmCollisionDetectionShape isCollidingWith: anotherMorph]
		
]

{
	#category : #'collision detection',
	#'squeak_changestamp' : 'AZ 7/10/2018 15:59'
}
GMCollisionHandler >> morphsCollidingWith: aMorph [
	^ (self collisionMorphs 
		reject: [:morph | morph == aMorph])
		select: [:morph | self is: aMorph collidingWith: morph]
]

{
	#category : #'collision morphs',
	#'squeak_changestamp' : 'AZ 5/15/2018 20:10'
}
GMCollisionHandler >> removeAllMorphs [
	self collisionMorphs: OrderedCollection new.
]

{
	#category : #'collision morphs',
	#'squeak_changestamp' : 'AZ 6/12/2018 21:44'
}
GMCollisionHandler >> removeCollisionMorph: aMorph [
	self collisionMorphs remove: aMorph ifAbsent: [self error: 'CollisionHandler does not know this Morph.'].
]
