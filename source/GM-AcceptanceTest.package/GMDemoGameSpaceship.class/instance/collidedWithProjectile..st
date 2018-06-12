collision
collidedWithProjectile: aProjectile
	self ~~ aProjectile creator ifTrue: 
		[self kill.
		aProjectile kill].