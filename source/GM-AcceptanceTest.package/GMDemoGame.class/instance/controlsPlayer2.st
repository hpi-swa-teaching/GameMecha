game logic
controlsPlayer2
	^ OrderedDictionary newFrom: {
		#leftKey -> Character arrowLeft.
		#rightKey -> Character arrowRight.
		#downKey -> Character arrowDown.
		#upKey -> Character arrowUp.
	}