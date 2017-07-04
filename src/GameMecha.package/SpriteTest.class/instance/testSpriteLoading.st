as yet unclassified
testSpriteLoading
	| cache selfMadeTestForm testForm indexTestForm |
	cache := ImageCache newOn: 'GMTest'.
	cache registerSpriteSheet: 'sheet.png' withColumns: 4 andRows: 4 .
	self assert: (cache isSpriteSheetLoaded: 'sheet.png').
	cache getSprite: 'sheet.png' atColumn: 2 andRow: 1 .
	self assert: (cache isSpriteLoaded: 'sheet.png' atColumn: 2 andRow: 1)."already requested -> cached"
	self deny: (cache isSpriteLoaded: 'sheet.png' atColumn: 2 andRow: 2)."not yet requested -> not cached"
	self deny: (cache isSpriteLoaded: 'sheet.png' atColumn: 5 andRow: 5)."out of bounds -> not cached"

	testForm := cache getSprite: 'sheet.png'  atColumn: 2 andRow: 3.
	selfMadeTestForm := cache getPartOf: 'sheet.png' withBounds: (154@400 corner: 308@600).
	self assert: testForm bits equals: selfMadeTestForm bits.
	indexTestForm := cache getSprite: 'sheet.png' atIndex: 10.
	self assert: testForm bits equals: indexTestForm bits.