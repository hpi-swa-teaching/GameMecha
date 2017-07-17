*GameMecha-Collisions
intersects: otherMorph
	"TODO find better name"
	"dispatch collisionHandling to my collisionBehavior"
	^ self collisionBehavior intersects: otherMorph.