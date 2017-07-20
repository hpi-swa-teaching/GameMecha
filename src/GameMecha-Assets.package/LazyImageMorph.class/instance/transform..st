transformation
transform: form
	| sub |
	sub := self createRealImage: form.
	sub bounds: self bounds.
	sub privateOwner: self owner.
	self become: sub.
	self changed.