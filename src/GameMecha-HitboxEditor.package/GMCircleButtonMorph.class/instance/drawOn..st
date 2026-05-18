as yet unclassified
drawOn: aCanvas

	| b inner |
	b := self bounds.
	inner := b insetBy: 8.
	aCanvas fillOval: inner color: self currentColor