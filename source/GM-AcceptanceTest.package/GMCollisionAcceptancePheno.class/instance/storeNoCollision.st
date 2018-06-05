collisionchecks
storeNoCollision
	self collisionChecks add: (self currentCollisionCheck shouldCollide: false).
	self topLevel displayNotification: 'collision saved' asString type: #info.
	self addCollisionDescription: 'no collision'.