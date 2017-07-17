accessing
touchesPlayer
	touchesPlayer ifNil: [self touchesPlayer: false].
	^ touchesPlayer.