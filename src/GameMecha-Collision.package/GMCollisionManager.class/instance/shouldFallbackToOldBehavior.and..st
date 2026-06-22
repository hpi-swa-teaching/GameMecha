backwards-compatibility
shouldFallbackToOldBehavior: aMorph and: anotherMorph

	^ ((aMorph respondsTo: #collider) and: (anotherMorph respondsTo: #collider)) not and: ((aMorph respondsTo: #gmCollisionDetectionShape) and: (anotherMorph respondsTo: #gmCollisionDetectionShape))