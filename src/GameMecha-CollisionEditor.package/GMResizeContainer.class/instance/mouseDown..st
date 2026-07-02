event handling
mouseDown: evt

	self dragOffset: evt hand position.
	self editor ifNotNil: [
		self editor canvasMorph activeMorph: self.
		self editor propertyPanel updateFrom: self].
	evt hand newMouseFocus: self