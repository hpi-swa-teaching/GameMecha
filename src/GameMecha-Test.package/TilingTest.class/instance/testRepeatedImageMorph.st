as yet unclassified
testRepeatedImageMorph
	|bgForm repeatingMorph|

	bgForm := Form makeStar.
	repeatingMorph := RepeatingImageMorph new.
	
	repeatingMorph image: bgForm.
	repeatingMorph extent: 800@600.
	repeatingMorph offset: 30@30.