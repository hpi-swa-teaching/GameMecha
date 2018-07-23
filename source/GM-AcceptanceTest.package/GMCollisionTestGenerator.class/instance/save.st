collision checks
save
	self storeChecksInInstanceOf: GMCollisionAutomatedAcceptanceTest.
	self topLevel displayNotification: 'saved' asString type: #info.
	self resetChecks.