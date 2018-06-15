game logic
controlsPlayer1
	^ OrderedDictionary newFrom: {
		#leftKey -> $a.
		#rightKey -> $d.
		#downKey -> $s.
		#upKey -> $w.}