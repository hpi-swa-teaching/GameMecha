as yet unclassified
parachuteMorph: evt

	| copy |
	"Kopie erstellen die gedraggt wird"
	copy := self class new.
	copy action: action.
	copy extent: self extent.
	self world addMorph: copy.
	copy position: self position.
	evt hand grabMorph: copy.
	isPressed := false.
	self changed