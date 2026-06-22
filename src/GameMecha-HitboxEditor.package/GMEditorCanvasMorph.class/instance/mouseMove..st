mousebehaviour
mouseMove: anEvent

	| surfacePoint localMousePosition |
	activeMorph ifNotNil: [
		surfacePoint := self viewport globalPointToLocal: anEvent position.
		localMousePosition := self viewport transform invertPoint: surfacePoint.
		
		activeMorph position: localMousePosition - dragOffset]