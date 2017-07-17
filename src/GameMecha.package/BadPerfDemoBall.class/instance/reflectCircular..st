as yet unclassified
reflectCircular: otherObject
	|normal reflect|
	normal := (self position - otherObject position).
	normal isZero
		ifTrue: [reflect := self direction negated]
		ifFalse: [
			normal := normal normalized.
			reflect := self direction - (normal * (2 * (self direction dotProduct: normal))).].
	self direction: reflect.