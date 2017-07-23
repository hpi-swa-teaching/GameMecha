*GameMecha-Collisions
intersectsWith: otherMorph
	"TODO find better name"
	"dispatch collisionHandling to my collisionBehavior"
	^ self collisionBehavior intersects: otherMorph.