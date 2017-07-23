as yet unclassified
testSpriteLoading
	| fileName spriteSheet imports selfMadeTestForm testForm indexTestForm |
	imports := Imports default.
	fileName := 'GMTest/sheet.png'.
	spriteSheet := SpriteSheet fromFile: fileName rows: 4 columns: 4.
	spriteSheet imageAt: 2@1.
	self assert: (imports isLoaded: fileName).
	self assert: (imports isLoaded: (spriteSheet cacheKeyOfSprite: 2@1))."already requested -> cached"
	self deny: (imports isLoaded: (spriteSheet cacheKeyOfSprite: 1@2))."not yet requested -> not cached"
	self deny: (imports isLoaded: (spriteSheet cacheKeyOfSprite: 5@5))."out of bounds -> not cached"

	testForm := spriteSheet imageAt: 2@3.
	selfMadeTestForm := (imports get: fileName) contentsOfArea: (154@400 corner: 308@600).
	self assert: testForm bits equals: selfMadeTestForm bits.
	indexTestForm := spriteSheet imageAt: 10.
	self assert: testForm bits equals: indexTestForm bits.