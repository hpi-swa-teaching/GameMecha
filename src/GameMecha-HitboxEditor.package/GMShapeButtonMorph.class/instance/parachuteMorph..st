accessing
parachuteMorph: evt

	| copy |
	copy := self class new.
	copy action: action.
	copy extent: self extent.
	self world addMorph: copy.
	copy position: self position.
	evt hand grabMorph: copy.
	isPressed := false.
	self changed