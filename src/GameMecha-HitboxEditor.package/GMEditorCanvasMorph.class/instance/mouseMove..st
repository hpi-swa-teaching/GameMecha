mousebehaviour
mouseMove: anEvent

	| surfacePoint localMousePosition |
	self clickedMorph ifNotNil: [
		surfacePoint := self viewport globalPointToLocal: anEvent position.
		localMousePosition := self viewport transform invertPoint: surfacePoint.
		
		self clickedMorph position: localMousePosition - self dragOffset]