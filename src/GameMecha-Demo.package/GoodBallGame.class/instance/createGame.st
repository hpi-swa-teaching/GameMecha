initializing
createGame
	|waterMorph|
	WebResources ensureFile: 'http://colpa.infine.casa:81/default-resources/other/smile.png' isAt: 'GMTest/smile.png'.
	super initialize.
	self bounds: (10 asPoint corner: 800@600).
	self keyboard: KeyHandler new.
	
	self keyboard addBindingFromKeys: #keyEscape as: #exit.
	self keyboard addBindingFromKeys: {#keyArrowUp. 'w'} as: #up.
	self keyboard addBindingFromKeys: {#keyArrowLeft. 'a'} as: #left.
	self keyboard addBindingFromKeys: {#keyArrowDown. 's'} as: #down.
	self keyboard addBindingFromKeys: {#keyArrowRight. 'd'} as: #right.
	
	self registerKeyHandler: self keyboard.
	self addCollider: ((GoodBallGameObstacle wrap: (LazyImageMorph newWithImage: 'GMTest/smile.png' placeHolder: Color red bounds: (20@300 extent: 60@60)))).
	self addCollider: ((GoodBallGameObstacle wrap: RectangleMorph new)
		position: (200@70);
		yourself).
	
	"world registerCollisionHandler: [:anEvent | world delete]."
	ball := GoodBallGameBall wrap: (LazyImageMorph newWithImage: 'GMTest/smile.png' placeHolder: Color red bounds: (20@20 extent: 60@60)).
	ball keyboard: self keyboard.
	self addCollider: ball.
	
	waterMorph := RepeatingImageMorph new.
	waterMorph image: (Imports default get: 'GMTest/smile.png').
	waterMorph extent: 120@130.
	waterMorph baseScale: 0.3@0.7.
	waterMorph offset: 10@20.
	water := GoodBallGameObstacle wrap: waterMorph.
	
	self addCollider: (water
		position: (20@100);
		yourself).
		
	self addCollider: ((GoodBallGameMovingObstacle wrap: RectangleMorph new)
		startPosition: (250@200);
		endPosition: (160@240);
		yourself).
	
	
	self openInWorld.