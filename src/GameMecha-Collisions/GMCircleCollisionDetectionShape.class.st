"
A GMCircleCollisionDetectionShape is a strategy for morphs which want to collide with their circle collision shape.
It supplies methods for the double dispatch.
"
Class {
	#name : #GMCircleCollisionDetectionShape,
	#superclass : #GMCollisionDetectionShape,
	#category : #'GameMecha-Collisions',
	#'squeak_changestamp' : 'brh 6/26/2018 21:30'
}

{
	#category : #utility,
	#'squeak_changestamp' : 'brh 7/25/2018 22:43'
}
GMCircleCollisionDetectionShape >> absDistanceFrom: aPoint to: anotherPoint [
	^ (anotherPoint - aPoint) abs
]

{
	#category : #utility,
	#'squeak_changestamp' : 'AZ 7/25/2018 23:01'
}
GMCircleCollisionDetectionShape >> circleAt: circlePos mustIntersectRectangleAt: rectanglePos withExtent: rectangleExtent [
	^ ((self absDistanceFrom: circlePos to: rectanglePos) x <= (rectangleExtent x / 2) or:
		[(self absDistanceFrom: circlePos to: rectanglePos) y <= (rectangleExtent y / 2)])
]

{
	#category : #utility,
	#'squeak_changestamp' : 'AZ 7/25/2018 23:02'
}
GMCircleCollisionDetectionShape >> circleAt: circlePos withRadius: circleRadius canIntersectRectangleAt: rectanglePos withExtent: rectangleExtent [
	^ (self absDistanceFrom: circlePos to: rectanglePos) x < (rectangleExtent x / 2 + circleRadius) and:
		[(self absDistanceFrom: circlePos to: rectanglePos) y < (rectangleExtent y / 2 + circleRadius)]
]

{
	#category : #utility,
	#'squeak_changestamp' : 'AZ 7/25/2018 23:03'
}
GMCircleCollisionDetectionShape >> circleAt: circlePos withRadius: circleRadius isCollidingWithRectangleAt: rectanglePos withExtent: rectangleExtent [
	(self circleAt: circlePos 
		withRadius: circleRadius 
		canIntersectRectangleAt: rectanglePos 
		withExtent: rectangleExtent)
		ifFalse: [^ false].
	(self circleAt: circlePos
		mustIntersectRectangleAt: rectanglePos 
		withExtent: rectangleExtent)
		ifTrue: [^ true].
	^ self circleAt: circlePos withRadius: circleRadius isIntersectingRectangleAt: rectanglePos withExtent: rectangleExtent
]

{
	#category : #utility,
	#'squeak_changestamp' : 'AZ 7/25/2018 23:03'
}
GMCircleCollisionDetectionShape >> circleAt: circlePos withRadius: circleRadius isIntersectingRectangleAt: rectanglePos withExtent: rectangleExtent [
	"Because we calculated circleDistance we can now imagine the rectangle center in 0 @ 0, 
	the circle center at circleDistance and the rectangle corner at (aMorph extent)."
	^ ((self absDistanceFrom: circlePos to: rectanglePos) squaredDistanceTo: rectangleExtent / 2) <= 
		circleRadius squared
]

{
	#category : #collision,
	#'squeak_changestamp' : 'TP 7/10/2018 16:20'
}
GMCircleCollisionDetectionShape >> isCollidingWith: aMorph [
	^ aMorph gmCollisionDetectionShape isCollidingWithCircle: self owner
]

{
	#category : #collision,
	#'squeak_changestamp' : 'brh 7/24/2018 20:48'
}
GMCircleCollisionDetectionShape >> isCollidingWithCircle: aMorph [
	^ (self owner center squaredDistanceTo: aMorph center) < 
		((self radius + aMorph gmCollisionDetectionShape radius) squared)
]

{
	#category : #collision,
	#'squeak_changestamp' : 'brh 7/25/2018 22:23'
}
GMCircleCollisionDetectionShape >> isCollidingWithRectangle: aMorph [
	^ self
		circleAt: self owner center 
		withRadius: self radius 
		isCollidingWithRectangleAt: aMorph center
		withExtent: aMorph extent
]

{
	#category : #collision,
	#'squeak_changestamp' : 'TP 7/10/2018 16:20'
}
GMCircleCollisionDetectionShape >> isCollidingWithRotatedRectangle: aMorph [
	^ aMorph gmCollisionDetectionShape isCollidingWithCircle: self owner
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'AZ 7/15/2018 17:09'
}
GMCircleCollisionDetectionShape >> radius [
	^ (self owner extent x min: self owner extent y) / 2
]
