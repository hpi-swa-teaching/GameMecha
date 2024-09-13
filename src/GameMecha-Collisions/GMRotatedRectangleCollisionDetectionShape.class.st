"
A GMRotatedRectangleCollisionDetectionShape is a strategy for morphs which want to collide with their rotated rectangle collision shape.
It supplies methods for the double dispatch.
A Morph gets a TransformationMorph when rotating. It expects the TransformationMorph to be the owner of the morph with the shape (default).
"
Class {
	#name : #GMRotatedRectangleCollisionDetectionShape,
	#superclass : #GMCollisionDetectionShape,
	#category : #'GameMecha-Collisions',
	#'squeak_changestamp' : 'NK 7/24/2018 15:26'
}

{
	#category : #utility,
	#'squeak_changestamp' : 'brh 7/25/2018 22:41'
}
GMRotatedRectangleCollisionDetectionShape >> areCorners: aCornerCollection intersectingWith: anotherCornerCollection onSeparatingAxes: axes [
	^ axes noneSatisfy: [:axis |
		self
			corners: (aCornerCollection collect: [:corner | corner dotProduct: axis]) 
			notOverlapping: (anotherCornerCollection collect: [:corner | corner dotProduct: axis])]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 5/28/2018 17:01'
}
GMRotatedRectangleCollisionDetectionShape >> corners [
	^ self originalCorners collect: [:originalCorner |
		(originalCorner * self owner scale 
			rotateBy: self owner angle about: self originalRectangle center) 
			+ self owner center]
]

{
	#category : #utility,
	#'squeak_changestamp' : 'brh 7/25/2018 22:38'
}
GMRotatedRectangleCollisionDetectionShape >> corners: aCornerCollection notOverlapping: anotherCornerCollection [
	^ aCornerCollection max <= anotherCornerCollection min or:
		[aCornerCollection min >= anotherCornerCollection max]
]

{
	#category : #collision,
	#'squeak_changestamp' : 'TP 7/10/2018 16:20'
}
GMRotatedRectangleCollisionDetectionShape >> isCollidingWith: aMorph [
	^ aMorph gmCollisionDetectionShape isCollidingWithRotatedRectangle: self owner
]

{
	#category : #collision,
	#'squeak_changestamp' : 'brh 7/25/2018 22:49'
}
GMRotatedRectangleCollisionDetectionShape >> isCollidingWithCircle: aMorph [
	^ aMorph gmCollisionDetectionShape 
		circleAt: (self rotatePointAroundCenter: aMorph center)
		withRadius: aMorph gmCollisionDetectionShape radius
		isCollidingWithRectangleAt: self owner center
		withExtent: self rectangleExtent
]

{
	#category : #collision,
	#'squeak_changestamp' : 'AZ 7/15/2018 17:11'
}
GMRotatedRectangleCollisionDetectionShape >> isCollidingWithRectangle: aMorph [
	^ self 
		areCorners: self corners
		intersectingWith: aMorph gmCollisionDetectionShape corners
		onSeparatingAxes: (self separatingAxes union: aMorph gmCollisionDetectionShape separatingAxes)
]

{
	#category : #collision,
	#'squeak_changestamp' : 'brh 6/9/2018 16:03'
}
GMRotatedRectangleCollisionDetectionShape >> isCollidingWithRotatedRectangle: aTransformationMorph [
	^ self isCollidingWithRectangle: aTransformationMorph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 7/15/2018 18:19'
}
GMRotatedRectangleCollisionDetectionShape >> originalCorners [
	^ self originalRectangle bounds corners
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 5/29/2018 19:20'
}
GMRotatedRectangleCollisionDetectionShape >> originalRectangle [
	^ self owner renderedMorph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 7/25/2018 21:41'
}
GMRotatedRectangleCollisionDetectionShape >> rectangleExtent [
	^ self originalRectangle extent * self owner scale
]

{
	#category : #utility,
	#'squeak_changestamp' : 'brh 7/25/2018 21:35'
}
GMRotatedRectangleCollisionDetectionShape >> rotatePointAroundCenter: aPoint [
	^ aPoint rotateBy: self owner angle negated about: self owner center
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 6/9/2018 16:03'
}
GMRotatedRectangleCollisionDetectionShape >> separatingAxes [
	^ {(1 @ 0) rotateBy: self owner angle about: (0 @ 0).
		(0 @ 1) rotateBy: self owner angle about: (0 @ 0)}
]
