initializing
createGame
	| obstacle |
	WebResources ensureFile: 'http://colpa.infine.casa:81/default-resources/other/smile.png' isAt: 'GMTest/smile.png'.

	self bounds: (10 asPoint corner: 800@600).
	self keyboard: KeyHandler new.
	
	self keyboard addBindingFromKeys: #keyEscape as: #exit.
	self keyboard addBindingFromKeys: {#keyArrowUp. 'w'} as: #up.
	self keyboard addBindingFromKeys: {#keyArrowLeft. 'a'} as: #left.
	self keyboard addBindingFromKeys: {#keyArrowDown. 's'} as: #down.
	self keyboard addBindingFromKeys: {#keyArrowRight. 'd'} as: #right.
	
	self registerKeyHandler: self keyboard.
	obstacle := LazyImageMorph newWithImage: 'GMTest/smile.png' placeHolder: Color red bounds: (20@300 extent: 60@60).
	self addCollider: (self setupObstacle: obstacle).
	
	obstacle := (RectangleMorph new position:(200@70); yourself).
	self addCollider: (self setupObstacle: obstacle).
	
	"world registerCollisionHandler: [:anEvent | world delete]."
	"ball := GoodBallGameBall wrap: (LazyImageMorph newWithImage: 'GMTest/smile.png' placeHolder: Color red bounds: (20@20 extent: 60@60)).
	"self halt.
	ball := GoodBallGameBall newWithImage: 'GMTest/smile.png' placeHolder: Color red bounds: (20@20 extent: 60@60).
	"ball keyboard: self keyboard."
	ball keyboard: self keyboard. 
	ball registerKeyHandler: self keyboard.
	self addCollider: ball.
	
	water :=RepeatingImageMorph new
			image: (Imports default get: 'GMTest/smile.png');
			extent: 120@130;
			baseScale: 0.3@0.7;
			offset: 10@20;
			yourself.
	self addCollider: (water
		position: (20@100);
		yourself).
		
	self addCollider: (GoodBallGameMovingObstacle new
		startPosition: (250@200);
		endPosition: (160@240);
		yourself).
	
	
	self openInWorld.