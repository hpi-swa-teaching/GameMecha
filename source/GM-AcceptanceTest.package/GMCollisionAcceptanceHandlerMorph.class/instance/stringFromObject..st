printing
stringFromObject: anObject
	anObject class = TransformationMorph ifTrue: [^ self stringFromTransformationMorph: anObject].
	^ self stringFromMorph: anObject.
	