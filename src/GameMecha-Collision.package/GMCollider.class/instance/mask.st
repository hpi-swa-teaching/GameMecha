accessing
mask

	^ mask ifNil: [self parent mask]