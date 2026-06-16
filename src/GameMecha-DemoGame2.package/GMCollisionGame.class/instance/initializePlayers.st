initialize-release
initializePlayers

	"we use different mask and layers (and symbols for better readability) for player1 and player2 so that they can shoot each other, while also being on a shared layer for both players"
	| player1 player2 |
	player1 := GMCollisionGamePlayer new.
	player1
		center: 200px @ 200px;
		layers: self player1Layers;
		mask: self player1Mask;
		controls: self player1Controls;
		projectileSymbol: self player1ProjectileSymbol;
		otherPlayerProjectileSymbol: self player2ProjectileSymbol.
	self addMorph: player1.
	
	player2 := GMCollisionGamePlayer new.
	player2
		center: 950px @ 200px;
		layers: self player2Layers;
		mask: self player2Mask;
		controls: self player2Controls;
		projectileSymbol: self player2ProjectileSymbol;
		otherPlayerProjectileSymbol: self player1ProjectileSymbol.
	self addMorph: player2