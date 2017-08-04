*GameMecha-Collisions
removeColliders
	"removes all submorphs"
	
	self submorphs select: [:sub| sub isCollider] thenDo:[:sub| sub delete].