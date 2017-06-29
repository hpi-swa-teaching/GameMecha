accessing
transformIndex: imageIndex
	|index|
	index := imageIndex.
	index := self looping
		ifTrue: [index \\ self frameCount]
		ifFalse: [index min: (self frameCount - 1)].
		
	^ index + 1. "one-indexed squeak"
	