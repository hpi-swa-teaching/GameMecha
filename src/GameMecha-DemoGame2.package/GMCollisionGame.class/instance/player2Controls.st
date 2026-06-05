accessing
player2Controls

	^ OrderedDictionary newFrom: {
		#leftKey -> Character arrowLeft.
		#rightKey -> Character arrowRight.
		#downKey -> Character arrowDown.
		#upKey -> Character arrowUp.
		#shootKey -> $m.}