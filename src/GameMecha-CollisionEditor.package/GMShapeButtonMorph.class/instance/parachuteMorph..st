accessing
parachuteMorph: evt

	| copy |
	copy := self class new
		action: self action;
		extent: self extent.
	self world addMorph: copy.
	copy position: self position.
	evt hand grabMorph: copy.
	self
		isPressed: false;
		changed