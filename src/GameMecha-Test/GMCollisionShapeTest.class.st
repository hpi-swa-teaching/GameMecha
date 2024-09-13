"
This abstract test provides functionality for testing specific the GMCollisionDetectionShape subclasses.
"
Class {
	#name : #GMCollisionShapeTest,
	#superclass : #GMCollisionTest,
	#category : #'GameMecha-Test',
	#'squeak_changestamp' : 'NK 7/24/2018 15:07'
}

{
	#category : #testing,
	#'squeak_changestamp' : 'brh 7/10/2018 17:22'
}
GMCollisionShapeTest class >> isAbstract [
	^ super isAbstract or: [self name = #GMCollisionShapeTest]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 7/15/2018 14:39'
}
GMCollisionShapeTest >> strategy [
	self subclassResponsibility.
]

{
	#category : #running,
	#'squeak_changestamp' : 'brh 6/11/2018 17:42'
}
GMCollisionShapeTest >> tearDown [
	self collisionHandler removeAllMorphs.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'brh 7/15/2018 14:39'
}
GMCollisionShapeTest >> testStoreOn [
	self assert: ((Compiler evaluate: 
			((WriteStream on: '')
				store: self strategy;
				contents))
			class)
		equals: self strategy class.
		
]
