collision
isCollidingWithRectangle: aMorph
	| ourCorners otherCorners axes |
	ourCorners := self corners.
	otherCorners := aMorph collisionDetectionStrategy corners.
	axes := self axes union: {1 @ 0. 0 @ 1}.
	
	axes do: [ :axis | | ourProjectedCorners otherProjectedCorners |
		ourProjectedCorners := ourCorners collect: [ :corner | corner dotProduct: axis].
		otherProjectedCorners := otherCorners collect: [ :corner | corner dotProduct: axis].
		ourProjectedCorners max <= otherProjectedCorners min ifTrue: [^false].
		ourProjectedCorners min >= otherProjectedCorners max ifTrue: [^false]].
	
	^true