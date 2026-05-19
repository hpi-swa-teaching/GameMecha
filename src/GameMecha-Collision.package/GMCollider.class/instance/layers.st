accessing
layers

	^ layers ifNil: [self parent layers]