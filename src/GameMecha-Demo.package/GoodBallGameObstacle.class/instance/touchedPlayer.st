accessing
touchedPlayer
	touchedPlayer ifNil: [self touchedPlayer: false].
	^ touchedPlayer.