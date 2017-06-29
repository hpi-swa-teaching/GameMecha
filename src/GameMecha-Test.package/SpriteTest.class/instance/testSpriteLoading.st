as yet unclassified
testSpriteLoading
	| cache selfMadeTestForm testForm |
	cache := ImageCache newOn: 'GMTest'.
	cache registerSpriteSheet: 'sheet.png' withColumns: 4 andRows: 4 .
	self assert: (cache isSpriteSheetLoaded: 'sheet.png').
	cache getSprite: 'sheet.png' atColumn: 2 andRow: 1 .
	self assert: (cache isSpriteLoaded: 'sheet.png' atColumn: 2 andRow: 1 ).
	self deny: (cache isSpriteLoaded: 'sheet.png' atColumn: 5 andRow: 5).

	testForm := cache getSprite: 'sheet.png'  atColumn: 2 andRow: 3.
	selfMadeTestForm := cache getPartOf: 'sheet.png' withBounds: (154@400 corner: 308@600).
	self assert: testForm bits equals: selfMadeTestForm bits.