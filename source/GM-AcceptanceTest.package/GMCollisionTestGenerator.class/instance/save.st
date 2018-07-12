collisionchecks
save
	self storeChecksOnClass: GMCollisionAutomatedAcceptanceTest.
	self topLevel displayNotification: 'saved' asString type: #info.
	self resetChecks.