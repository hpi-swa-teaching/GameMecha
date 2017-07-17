as yet unclassified
testRepeatedImageMorph
	|bgForm repeatingMorph canvas|
	"Loads example form"
	bgForm := Form makeStar.
	
	"create canvas to render form"
	canvas := FormCanvas on: 
		(Form
  			extent: 1920@1080
  			depth: bgForm depth).
	
	"create the RepeatingImageMorph"
	repeatingMorph := RepeatingImageMorph new.
	
	repeatingMorph image: bgForm.
	repeatingMorph extent: 800@600.
	repeatingMorph offset: 30@30.
	
	"draw the morph on the canvas"
	repeatingMorph drawOn: canvas.
	"assert that the drawn image equals the example image at given offset and when its repeating, not at any other offset"
	self assert: (canvas form contentsOfArea: (30@30 extent: 50@50)) bits equals: bgForm bits.
	self assert: (canvas form contentsOfArea: (80@80 extent: 50@50)) bits equals: bgForm bits.
	self deny: (canvas form contentsOfArea: (29@80 extent: 50@50)) bits = bgForm bits.
	 
	"clear canvas"
	canvas := FormCanvas on: 
		(Form
  			extent: 1920@1080
  			depth: bgForm depth).
		
	"draw again with different baseScale"
	repeatingMorph baseScale: 2.
	repeatingMorph drawOn: canvas.
	self deny: ((canvas form contentsOfArea: (30@30 extent: 100@100)) bits = bgForm bits).
	self assert: (canvas form contentsOfArea: (30@30 extent: 100@100)) bits equals: (bgForm magnifyBy: 2) bits.