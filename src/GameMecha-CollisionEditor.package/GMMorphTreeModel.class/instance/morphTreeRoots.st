event-handling
morphTreeRoots

	self canvasMorph isNil ifTrue: [^ #()].
	^ self canvasMorph allHitboxContents