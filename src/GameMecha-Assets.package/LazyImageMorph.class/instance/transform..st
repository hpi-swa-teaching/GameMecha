transformation
transform: form
	"this is bad. We should not youse self>>become, but instead start as an imageMorph and change its drawing functionality. But it works"
	| sub |
	sub := self createRealImage: form.
	sub bounds: self bounds.
	sub privateOwner: self owner.
	self become: sub.
	self changed.