stepping and presenter
step 

	"the collisionManager doesn't implement step by itself, so it's update method needs to be called in order for it to distribute notifications"
	super step.
	self checkSpawnTimer.
	self collisionManager update.
	self emptyDeleteQueue
	