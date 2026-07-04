drawing
addHitboxToCanvas: aMorph

	| container |
	container := GMResizeContainer new
		setContent: aMorph;
		editor: self editor;
		center: 0 @ 0;
		yourself.
	self viewport addMorph: container.
	self activeMorph: container