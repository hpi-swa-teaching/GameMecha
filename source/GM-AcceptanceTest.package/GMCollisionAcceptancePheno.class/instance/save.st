collisionchecks
save
	GMCollisionAutomatedAcceptanceTest storeChecks: self collisionChecks.
	self topLevel displayNotification: 'saved' asString type: #info.
	self resetChecks.