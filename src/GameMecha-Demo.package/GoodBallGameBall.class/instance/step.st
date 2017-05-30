initializing
step
	super step.
	self position: self position + (self keyboard WASDVector * 10 asPoint).