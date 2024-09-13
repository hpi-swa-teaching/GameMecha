"
This is a morph with two submorphs, providing the setup and creation of the collision scenario for the GMCollisionTestGenerator.

"
Class {
	#name : #GMCollisionTestGeneratorMorphContainer,
	#superclass : #Morph,
	#instVars : [
		'collisionMorphs',
		'collisionHandler',
		'shouldCollide',
		'collisionShapeDictionary'
	],
	#category : #'GameMecha-Test',
	#'squeak_changestamp' : 'NK 7/24/2018 16:11'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'brh 6/11/2018 15:41'
}
GMCollisionTestGeneratorMorphContainer class >> collisionMorphExtent [
	^ 100 @ 100
]

{
	#category : #constants,
	#'squeak_changestamp' : 'brh 7/24/2018 20:52'
}
GMCollisionTestGeneratorMorphContainer class >> crWithIndent [
	^ String cr, String tab, String tab
]

{
	#category : #collision,
	#'squeak_changestamp' : 'brh 6/11/2018 14:09'
}
GMCollisionTestGeneratorMorphContainer >> addCollisionMorphs: aCollection [
	self collisionMorphs addAll: aCollection.
	self collisionMorphs do: [:aMorph |
		self addMorph: aMorph.
		self collisionHandler addCollisionMorph: aMorph].
]

{
	#category : #collision,
	#'squeak_changestamp' : 'AZ 7/15/2018 18:05'
}
GMCollisionTestGeneratorMorphContainer >> chooseCollisionScenario: aCollisionMorphShape with: anotherCollisionMorphShape [
	self removeAllMorphsIn: self collisionMorphs.
	self	collisionMorphs: OrderedCollection new.
	self collisionHandler removeAllMorphs.
	self	addCollisionMorphs: 
		{(self collisionShapeDictionary at: aCollisionMorphShape) value.
		(self collisionShapeDictionary at: anotherCollisionMorphShape) value}.
	self shuffleMorphs.
]

{
	#category : #creation,
	#'squeak_changestamp' : 'TP 7/10/2018 16:23'
}
GMCollisionTestGeneratorMorphContainer >> circleCollisionMorph [
	^ CircleMorph new
		gmCollisionDetectionStrategy: GMCircleCollisionDetectionShape new;
		extent: self class collisionMorphExtent;
		position: self position;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 6/11/2018 14:08'
}
GMCollisionTestGeneratorMorphContainer >> collisionHandler [
	^ collisionHandler ifNil: [collisionHandler := GMCollisionHandler new]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 6/11/2018 14:08'
}
GMCollisionTestGeneratorMorphContainer >> collisionHandler: anObject [
	collisionHandler := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 6/11/2018 14:06'
}
GMCollisionTestGeneratorMorphContainer >> collisionMorphs [
	^ collisionMorphs ifNil: [collisionMorphs := OrderedCollection new]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 6/11/2018 14:04'
}
GMCollisionTestGeneratorMorphContainer >> collisionMorphs: anObject [
	collisionMorphs := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 7/15/2018 18:05'
}
GMCollisionTestGeneratorMorphContainer >> collisionShapeDictionary [
	^ collisionShapeDictionary ifNil: [collisionShapeDictionary := Dictionary newFrom: {
		#circleCollisionMorph -> [self circleCollisionMorph].
		#rectangleCollisionMorph -> [self rectangleCollisionMorph].
		#rotatedRectangleCollisionMorph -> [self rotatedRectangleCollisionMorph]}] 
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 7/15/2018 18:05'
}
GMCollisionTestGeneratorMorphContainer >> collisionShapeDictionary: anObject [
	collisionShapeDictionary := anObject
]

{
	#category : #collision,
	#'squeak_changestamp' : 'brh 6/26/2018 21:13'
}
GMCollisionTestGeneratorMorphContainer >> currentCollisionCheck [
 	^ (String streamContents: [:str |
		str nextPutAll: String cr, String tab, 'self assertCollision: '.
		str nextPutAll: (self stringFromObject: self submorphs first).
		str nextPutAll: String cr, String tab, ' with: '.
		str nextPutAll: (self stringFromObject: self submorphs last).
		str nextPutAll: String cr, String tab, ' equals: '.
		self shouldCollide storeOn: str])
]

{
	#category : #creation,
	#'squeak_changestamp' : 'TP 7/10/2018 16:23'
}
GMCollisionTestGeneratorMorphContainer >> rectangleCollisionMorph [
	^ RectangleMorph new
		gmCollisionDetectionStrategy: GMRectangleCollisionDetectionShape new;
		extent: self class collisionMorphExtent;
		position: self position;
		yourself
]

{
	#category : #creation,
	#'squeak_changestamp' : 'TP 7/10/2018 16:23'
}
GMCollisionTestGeneratorMorphContainer >> rotatedRectangleCollisionMorph [
	 | aMorph |
	aMorph := RectangleMorph new
		extent: self class collisionMorphExtent;
		position: self position;
		yourself.
	self addMorph: aMorph.
	aMorph addFlexShell.
	^ aMorph owner
		gmCollisionDetectionStrategy: GMRotatedRectangleCollisionDetectionShape new;
		angle: 30;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 6/11/2018 18:01'
}
GMCollisionTestGeneratorMorphContainer >> shouldCollide [
	^ shouldCollide
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 6/11/2018 18:01'
}
GMCollisionTestGeneratorMorphContainer >> shouldCollide: anObject [
	shouldCollide := anObject
]

{
	#category : #collision,
	#'squeak_changestamp' : 'brh 6/11/2018 14:08'
}
GMCollisionTestGeneratorMorphContainer >> shuffleMorphs [
	self collisionMorphs do:
		[:aMorph | aMorph position: self position + (100 @ 200) + (0 @ 200 atRandom)]
]

{
	#category : #'stepping and presenter',
	#'squeak_changestamp' : 'brh 6/26/2018 16:41'
}
GMCollisionTestGeneratorMorphContainer >> step [
	self collisionMorphs do:
		[:aMorph | (self collisionHandler morphsCollidingWith: aMorph)
			ifEmpty: [aMorph renderedMorph color: Color green]
			ifNotEmpty: [aMorph renderedMorph color: Color red]].
]

{
	#category : #'stepping and presenter',
	#'squeak_changestamp' : 'NK 6/12/2018 21:12'
}
GMCollisionTestGeneratorMorphContainer >> stepTime [
	^ 16
]

{
	#category : #printing,
	#'squeak_changestamp' : 'brh 7/24/2018 21:27'
}
GMCollisionTestGeneratorMorphContainer >> stringFromMorph: aMorph [
	^ String streamContents: [:str | 
		str nextPutAll: '('. aMorph class storeOn: str. str nextPutAll: ' new '.
		str nextPutAll: self class crWithIndent, 'gmCollisionDetectionStrategy: '. 
			aMorph gmCollisionDetectionShape storeOn: str. str nextPut: $;.
 		str nextPutAll: self class crWithIndent, 'position: '. aMorph position storeOn: str. str nextPut: $;.
	  	str nextPutAll: self class crWithIndent, 'extent: '. aMorph extent storeOn: str. str nextPut: $;.
		str nextPutAll: self class crWithIndent, 'yourself)']
]

{
	#category : #printing,
	#'squeak_changestamp' : 'AZ 7/15/2018 18:19'
}
GMCollisionTestGeneratorMorphContainer >> stringFromObject: anObject [
	anObject class = TransformationMorph ifTrue: [^ self stringFromTransformationMorph: anObject].
	^ self stringFromMorph: anObject
	
]

{
	#category : #printing,
	#'squeak_changestamp' : 'brh 7/24/2018 21:27'
}
GMCollisionTestGeneratorMorphContainer >> stringFromTransformationMorph: aTransformationMorph [
	^ String streamContents: [:str | 
		str nextPutAll: '(self rotatedRectangleShellWithAngle: '. aTransformationMorph angle storeOn: str.
		str nextPutAll: self class crWithIndent, 'withScale: '. aTransformationMorph scaleFactor storeOn: str.
	  	str nextPutAll: self class crWithIndent, 'atPosition: '. aTransformationMorph position storeOn: str. str nextPut: $)]
]
