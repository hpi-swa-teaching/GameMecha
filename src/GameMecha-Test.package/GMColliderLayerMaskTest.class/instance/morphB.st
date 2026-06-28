accessing
morphB

	^ morphB ifNil: [morphB := self morphOnLayer: #(2) withMask: #(1)]