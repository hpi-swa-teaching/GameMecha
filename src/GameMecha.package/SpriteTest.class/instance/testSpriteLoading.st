as yet unclassified
testSpriteLoading
	| cache testImage selfMadeTestImage selfMadeTestForm testForm |
	cache := ImageCache newOn: 'HOP'.
	cache loadSpriteSheet: 'sheet.png' withDimensions: (4@4).
	self assert: (cache isLoaded: 'sheet.png').
	self assert: (cache isLoaded: 'sheet.png_2_3').
	self deny: (cache isLoaded: 'sheet.png_5_5').
	"testImage := ImageMorph new newForm:(cache loadPartOf: (cache cachedElements at: (cache class pathToCollection: 'sheet.png')) withBounds: (100@200 extent: 200@323))."
	"testImage openInWorld." 
	testForm := cache get: 'sheet.png_2_3'.
	testImage := testForm asMorph.
	selfMadeTestForm := cache loadPartOf: (cache cachedElements at: (cache class pathToCollection: 'sheet.png')) withBounds: (154@400 corner: 308@600).
	selfMadeTestImage := selfMadeTestForm asMorph.
	self assert: testForm bits equals: selfMadeTestForm bits.