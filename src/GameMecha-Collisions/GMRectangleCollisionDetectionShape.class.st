"
A GMRectangleCollisionDetectionShape is a strategy for morphs which want to collide with their rectangle collision shape.
It supplies methods for the double dispatch.
"
Class {
	#name : #GMRectangleCollisionDetectionShape,
	#superclass : #GMCollisionDetectionShape,
	#category : #'GameMecha-Collisions',
	#'squeak_changestamp' : 'brh 6/26/2018 21:30'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 6/26/2018 21:02'
}
GMRectangleCollisionDetectionShape >> corners [
	^ self owner bounds corners
]

{
	#category : #collision,
	#'squeak_changestamp' : 'TP 7/10/2018 16:20'
}
GMRectangleCollisionDetectionShape >> isCollidingWith: aMorph [
	^ aMorph gmCollisionDetectionShape isCollidingWithRectangle: self owner
]

{
	#category : #collision,
	#'squeak_changestamp' : 'TP 7/10/2018 16:20'
}
GMRectangleCollisionDetectionShape >> isCollidingWithCircle: aMorph [
	^ aMorph gmCollisionDetectionShape isCollidingWithRectangle: self owner
]

{
	#category : #collision,
	#'squeak_changestamp' : 'AZ 5/29/2018 19:25'
}
GMRectangleCollisionDetectionShape >> isCollidingWithRectangle: aMorph [
	^ self owner bounds intersects: aMorph bounds
]

{
	#category : #collision,
	#'squeak_changestamp' : 'TP 7/10/2018 16:20'
}
GMRectangleCollisionDetectionShape >> isCollidingWithRotatedRectangle: aMorph [
	^ aMorph gmCollisionDetectionShape isCollidingWithRectangle: self owner
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 6/9/2018 15:59'
}
GMRectangleCollisionDetectionShape >> separatingAxes [
	^ {1 @ 0. 0 @ 1}
]
