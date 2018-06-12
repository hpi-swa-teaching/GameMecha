collision
collidedWithProjectile: aProjectile
	self == aProjectile creator ifFalse: 
		[self kill.
		aProjectile kill].