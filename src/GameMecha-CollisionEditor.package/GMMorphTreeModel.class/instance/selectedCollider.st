accessing
selectedCollider

	self canvasMorph activeMorph ifNotNil: [^ self canvasMorph activeMorph content].
	^ nil