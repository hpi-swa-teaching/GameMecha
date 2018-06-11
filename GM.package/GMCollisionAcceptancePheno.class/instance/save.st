collisionchecks
save
	GMCollisionTest storeChecks: self collisionChecks.
	self topLevel displayNotification: 'saved' asString type: #info.
	self resetChecks.