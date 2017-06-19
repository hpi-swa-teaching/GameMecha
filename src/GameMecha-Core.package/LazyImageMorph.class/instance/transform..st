as yet unclassified
transform: form
	| sub |
	sub := self createRealImage: form.
	sub bounds: self bounds.
	sub privateOwner: self owner.
	self become: sub.
	sub position: sub position + (0 @ 1).