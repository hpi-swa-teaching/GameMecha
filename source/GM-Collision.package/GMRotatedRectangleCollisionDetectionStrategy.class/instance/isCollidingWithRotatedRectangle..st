collision
isCollidingWithRotatedRectangle: aTransformationMorph
	| ourCorners otherCorners axes |
	ourCorners := self corners.
	otherCorners := aTransformationMorph collisionDetectionStrategy corners.
	axes := self axes union: aTransformationMorph collisionDetectionStrategy axes.
	
	axes do: [ :axis | | ourProjectedCorners otherProjectedCorners |
		ourProjectedCorners := ourCorners collect: [ :corner | corner dotProduct: axis].
		otherProjectedCorners := otherCorners collect: [ :corner | corner dotProduct: axis].
		ourProjectedCorners max <= otherProjectedCorners min ifTrue: [^ false].
		ourProjectedCorners min >= otherProjectedCorners max ifTrue: [^ false]].
	
	^ true
		
		