collision
onCollision: aCollisionEvent

	
	(aCollisionEvent layers includes: 4) ifTrue: [self game deleteQueue add: self]. "hit by an enemy"
	(aCollisionEvent layers includes: (self mask at: 2) ) ifTrue: [self ammo: self ammo - 1]. "hit by the other players projectile"
	(aCollisionEvent layers includes: 8) ifTrue: [self ammo: self ammo + 0.02] "inside of the glowing area" 
	