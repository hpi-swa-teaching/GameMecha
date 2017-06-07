as yet unclassified
createDemo
	super initialize.
	self startStepping.
	self bounds: (10 asPoint corner: 800@600).
	self keyboard: Keyboard new.
	
	nextBallCtr := 0.
	self ballCtr: 0.
	
	"top"
	self addCollider: ((BadPerfDemoOstacle  wrap: (RectangleMorph new))
	position: (self position);
	extent: ((self width)@10);
	yourself ).
	
	"bottom"
	self addCollider: ((BadPerfDemoOstacle  wrap: (RectangleMorph new))
	position:(self position x)@( (self position y) +(self height) - 10);
	extent: ((self width)@10);
	yourself ).
	
	"left"
	self addCollider: ((BadPerfDemoOstacle  wrap: (RectangleMorph new))
	position:(self position x)@0;
	extent: (10@(self height));
	yourself).
	
	"right"
	self addCollider: ((BadPerfDemoOstacle  wrap: (RectangleMorph new))
	position:(self position x + self width  - 10)@0;
	extent: (10@(self height));
	yourself).
	
	self newBall.
	
	self openInWorld.
