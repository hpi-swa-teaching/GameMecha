as yet unclassified
step
	super step.
	"self dir: ((self keyboard WASDVector * (1 @ -1)) theta / Float pi * 8) floor."
	"self dir: (Sensor peekPosition x / 42) floor."
	self dir: ((Sensor peekPosition - self bounds origin - (self bounds extent * (0.5@0.8))  * (1 @ -1)) theta / Float pi * 8) floor.
	(self anim at: self dir + 1) displayOn: self.