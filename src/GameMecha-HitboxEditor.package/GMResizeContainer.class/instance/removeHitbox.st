event handling
removeHitbox

	self removeResizeHandles.
	self isRotated ifTrue: [
		self removeFlexShell.
		self isRotated: false].
	self delete