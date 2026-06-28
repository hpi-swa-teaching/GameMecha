accessing
morphC

	^ morphC ifNil: [morphC := self morphOnLayer: #(3) withMask: #(3)]