*GameMecha-Collisions
step
	"original step behavior"
	(self isWorldMorph and: [owner notNil]) ifTrue: [
		^self runLocalStepMethods
	].
	super step.
	"adjustments for collisionWorld behavior"
	(self isCollisionWorld) ifTrue: [self collisionWorldStep].