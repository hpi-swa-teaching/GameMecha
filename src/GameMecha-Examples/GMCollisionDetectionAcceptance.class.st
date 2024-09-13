"
This is an acceptance test for the GM collision mechanics. It is supposed to be opened like any other morph.
It demonstrates how to use the GM collision handling.

Once opened, it displays various morphs. All morphs colored red collide with another morph, the others are colored green.

The most important methods for collision detection are 'initialize' and 'collisionMorphXXXXXX', which display how to prepare a morph for collision, and 'step', which checks whether morphs are colliding.
"
Class {
	#name : #GMCollisionDetectionAcceptance,
	#superclass : #Morph,
	#instVars : [
		'collisionMorphs',
		'collisionHandler',
		'collisionMorphCircle',
		'collisionMorphRectangle'
	],
	#category : #'GameMecha-Examples',
	#'squeak_changestamp' : 'NK 7/24/2018 15:59'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'brh 6/5/2018 20:41'
}
GMCollisionDetectionAcceptance class >> collisionMorphExtent [
	^ 50 @ 50
]

{
	#category : #constants,
	#'squeak_changestamp' : 'NK 7/23/2018 17:21'
}
GMCollisionDetectionAcceptance class >> collisionMorphSpeed [
	^ 1 @ 0 
]

{
	#category : #constants,
	#'squeak_changestamp' : 'brh 6/5/2018 20:46'
}
GMCollisionDetectionAcceptance class >> worldExtent [
	^ 150 @ 100
]

{
	#category : #'stepping and presenter',
	#'squeak_changestamp' : 'NK 7/23/2018 17:24'
}
GMCollisionDetectionAcceptance >> clipPosition [ 
	^ self extent - self class collisionMorphExtent
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 5/21/2018 16:42'
}
GMCollisionDetectionAcceptance >> collisionHandler [
	^ collisionHandler ifNil: [collisionHandler := GMCollisionHandler new]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 5/21/2018 16:42'
}
GMCollisionDetectionAcceptance >> collisionHandler: anObject [
	collisionHandler := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 7/16/2018 13:49'
}
GMCollisionDetectionAcceptance >> collisionMorphCircle [
	^ collisionMorphCircle ifNil: [collisionMorphCircle := CircleMorph new
		"To give a Morph the ability to collide it needs a GMCollisionDetectionShape. You can  choose between
		GMCircleCollisionDetectionShape, GMRectangleCollisionDetectionShape or GMRotatedRectangleCollisionDetectionShape."
		gmCollisionDetectionStrategy: GMCircleCollisionDetectionShape new;
		extent: self class collisionMorphExtent;
		yourself]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 7/16/2018 13:47'
}
GMCollisionDetectionAcceptance >> collisionMorphCircle: anObject [
	^ collisionMorphCircle := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 7/16/2018 13:49'
}
GMCollisionDetectionAcceptance >> collisionMorphRectangle [
	^ collisionMorphRectangle ifNil: [collisionMorphRectangle :=RectangleMorph new
			"To give a Morph the ability to collide it needs a GMCollisionDetectionShape. You can  choose between
			GMCircleCollisionDetectionShape, GMRectangleCollisionDetectionShape or GMRotatedRectangleCollisionDetectionShape."
			gmCollisionDetectionStrategy: GMRectangleCollisionDetectionShape new;
			extent: self class collisionMorphExtent;
			position: (self class worldExtent x / 2) @ (self class worldExtent y / 3);
			yourself]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TP 7/10/2018 19:06'
}
GMCollisionDetectionAcceptance >> collisionMorphRectangle: anObject [
	^ collisionMorphRectangle := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 7/16/2018 13:53'
}
GMCollisionDetectionAcceptance >> collisionMorphs [
	^ collisionMorphs ifNil: [collisionMorphs := (OrderedCollection newFrom: 
		{self collisionMorphCircle.
		self createCollisionMorphFlexShellOfRotatedRectangle})]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 5/21/2018 16:42'
}
GMCollisionDetectionAcceptance >> collisionMorphs: anObject [
	collisionMorphs := anObject
]

{
	#category : #creation,
	#'squeak_changestamp' : 'AZ 7/16/2018 13:50'
}
GMCollisionDetectionAcceptance >> createCollisionMorphFlexShellOfRotatedRectangle [
	 | aMorph |
	aMorph := RectangleMorph new
		extent: self class collisionMorphExtent;
		yourself.
	self addMorph: aMorph.
	"You need to add a FlexShell to be able to rotate a Morph"
	aMorph addFlexShell.
	
	"ATTENTION: you have to add the TransformationMorph (FlexShell) to the GMCollisionHandler.
	Therefore we return the owner of the Morph which is this TransformationMorph (becaused wie sent addFlexShell before.
	See initialize for more detaisl."
	^ aMorph owner 
		"To give a Morph the ability to collide it needs a GMCollisionDetectionShape. You can choose between
		GMCircleCollisionDetectionShape, GMRectangleCollisionDetectionShape or GMRotatedRectangleCollisionDetectionShape."
		gmCollisionDetectionStrategy: GMRotatedRectangleCollisionDetectionShape new;
		angle: 30;
		yourself
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TP 7/10/2018 21:08'
}
GMCollisionDetectionAcceptance >> initialize [
	super initialize.
	self extent: self class worldExtent.
	self collisionMorphs do: [:aMorph | 
		self addMorph: aMorph. 
		"We add the Morphs to our GMCollisionHandler to be able to detect collisions between these Morphs.
		Attention in case of our RotatedRectangleMorph we add the TransformationMorph which is stored
		in the collisionMorphs collection. See collisionMorphRotatedrectangle for more details."
		self collisionHandler addCollisionMorph: aMorph].
	"For didactic reasons we handle our RectangleMorph a bit different to show another collision detection
	method (see step for more details). Notice that we do not register our RectangleMorph at our GMCollisionHandler"
	self addMorph: self collisionMorphRectangle.
]

{
	#category : #'stepping and presenter',
	#'squeak_changestamp' : 'brh 7/24/2018 20:49'
}
GMCollisionDetectionAcceptance >> moveCollisionMorphCircle [
	self collisionMorphCircle 
		position: (self collisionMorphCircle position + self class collisionMorphSpeed).
	self collisionMorphCircle position x > (self clipPosition x + self position x) 
		ifTrue: [self collisionMorphCircle 
			position: self position x @ self collisionMorphCircle position y].
	self collisionMorphCircle position y > (self clipPosition y + self position y) 
		ifTrue: [self collisionMorphCircle 
			position: self collisionMorphCircle position x @ self position y].
]

{
	#category : #'stepping and presenter',
	#'squeak_changestamp' : 'NK 7/23/2018 17:20'
}
GMCollisionDetectionAcceptance >> step [
	"We use our collisionHandler to get a list of all Morphs registered at this collisionHandler
	currently colliding with the specified Morph"
	self collisionMorphs do:
		[:aMorph | (self collisionHandler morphsCollidingWith: aMorph)
			ifEmpty: [aMorph renderedMorph color: Color green]
			ifNotEmpty: [aMorph renderedMorph color: Color red]].
	"Another possibility is to directly check for collision between two concrete Morphs. This does not
	require any of both Morphs to be registered at the GMCollisionHandler."
	(self collisionHandler is: self collisionMorphRectangle collidingWith: self collisionMorphCircle)
		 ifTrue: [self collisionMorphRectangle color: Color random].
	self moveCollisionMorphCircle.
]

{
	#category : #'stepping and presenter',
	#'squeak_changestamp' : 'brh 6/5/2018 20:42'
}
GMCollisionDetectionAcceptance >> stepTime [ 
	^ 50
]
