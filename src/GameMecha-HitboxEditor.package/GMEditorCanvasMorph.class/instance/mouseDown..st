mousebehaviour
mouseDown: anEvent
	"this implements, that morphs on the canvas can be moved with a click. Otherwise they would have to implement that themself"

	| surfacePoint localMousePosition |
	surfacePoint := self viewport globalPointToLocal: anEvent position.
	
	"this converts from the global coordinate system to the local"
	localMousePosition := self viewport transform invertPoint: surfacePoint.
	
	self activeMorph: (self viewport submorphs detect: 
		[:each | each containsPoint: localMousePosition] 
		ifNone: [nil]
		).
	
	self activeMorph ifNotNil: [
		self dragOffset: localMousePosition - self activeMorph position.
		self viewport addMorphFront: self activeMorph]