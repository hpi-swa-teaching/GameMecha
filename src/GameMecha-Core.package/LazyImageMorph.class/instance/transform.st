as yet unclassified
transform
	| sub |
	sub := self createRealImage.
	sub bounds: self bounds.
	sub privateOwner: self owner.
	self become: sub.
	sub position: sub position + (0 @ 1).