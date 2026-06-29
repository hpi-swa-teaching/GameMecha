drawing
addHitboxToCanvas: aMorph

	| container |
	aMorph position: self center - aMorph center.
	container := GMResizeContainer new
		setContent: aMorph;
		editor: self editor;
		yourself.
	self viewport addMorph:  container.
	container center: 0@0.
	self activeHitbox: container
	