"
This test contains auto generated tests from GMCollisionTestGenerator.
"
Class {
	#name : #GMCollisionAutomatedAcceptanceTest,
	#superclass : #GMCollisionTest,
	#category : #'GameMecha-Test',
	#'squeak_changestamp' : 'NK 7/24/2018 15:02'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'ek 9/8/2021 17:26'
}
GMCollisionAutomatedAcceptanceTest class >> collisionSelectors [
	^ {#testAcceptance220650680.
	}
]

{
	#category : #testing,
	#'squeak_changestamp' : 'NK 7/23/2018 13:36'
}
GMCollisionAutomatedAcceptanceTest >> rotatedRectangleShellWithAngle: aNumber withScale: anotherNumber atPosition: aPoint [
	| aMorph |
	aMorph := RectangleMorph new
		extent: 100 @ 100;
		yourself.
	Morph new addMorph: aMorph.
	aMorph addFlexShell.
	^ aMorph owner 
		gmCollisionDetectionStrategy: GMRotatedRectangleCollisionDetectionShape new;
		angle: aNumber;
		position: aPoint;
		scale: anotherNumber;
		yourself
]

{
	#category : #'test cases',
	#'squeak_changestamp' : 'ek 9/8/2021 17:26'
}
GMCollisionAutomatedAcceptanceTest >> testAcceptance220650680 [ 
	self assertCollision: (self rotatedRectangleShellWithAngle: 30
		withScale: 1.0
		atPosition: (408@418))
	 with: (CircleMorph new 
		gmCollisionDetectionStrategy: GMCircleCollisionDetectionShape new;
		position: (408@353);
		extent: (100@100);
		yourself)
	 equals: true
]
