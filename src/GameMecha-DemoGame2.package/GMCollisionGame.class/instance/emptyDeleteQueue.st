game logic
emptyDeleteQueue
	"we use a delete queue here, so that morphs aren't deleted in the middle of the collision checking"

	self deleteQueue do: [:each |
		self deleteQueue remove: each.
		self removeMorph: each.
		each release]