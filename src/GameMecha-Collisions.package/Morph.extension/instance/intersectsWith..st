*GameMecha-Collisions
intersectsWith: otherMorph
	"dispatch collisionHandling to my collisionBehavior"
	^ self collisionBehavior intersects: otherMorph.