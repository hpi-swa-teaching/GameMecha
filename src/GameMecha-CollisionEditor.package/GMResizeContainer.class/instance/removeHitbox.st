event handling
removeHitbox

	self removeResizeHandles.
	self isRotated ifTrue: [
		self
			removeFlexShell;
			isRotated: false].
	self delete