accessing
morphA

	^ morphA ifNil: [morphA := self morphOnLayer: #(1) withMask: #(2)]