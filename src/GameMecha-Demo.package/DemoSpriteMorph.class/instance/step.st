as yet unclassified
step
	super step.
	self dir: ((self keyboard WASDVector * (1 @ -1)) theta / Float pi * 8) floor.
	(self anim at: dir + 1) displayOn: self.