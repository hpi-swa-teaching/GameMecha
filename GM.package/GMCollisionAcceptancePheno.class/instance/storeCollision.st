collisionchecks
storeCollision
	self collisionChecks add: (self currentCollisionCheck shouldCollide: true).
	self topLevel displayNotification: 'collision saved' asString type: #info