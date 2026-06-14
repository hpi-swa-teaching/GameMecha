running
setUp
	
	morphA := self morphOnLayer: #(1) withMask: #(2).
	morphB := self morphOnLayer: #(2) withMask: #(1).
	morphC := self morphOnLayer: #(3) withMask: #(3).
	self collisionManager addMorphs: {morphA. morphB. morphC}