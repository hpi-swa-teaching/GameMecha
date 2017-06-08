stepping
step
	"Let all submorphs step. Then finish the current movement cycle
	by resolving collisions and letting each collider fetch their current bounds again"

	self submorphs do: [:sub | sub step].
	self resolveAllCollisions.
	self submorphs do: [:sub | sub fetchPreviousBounds].