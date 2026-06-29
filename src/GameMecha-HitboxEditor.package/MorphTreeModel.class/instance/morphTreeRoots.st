event-handling
morphTreeRoots

	canvasMorph isNil ifTrue: [^ #()].
	^ canvasMorph allHitboxContents