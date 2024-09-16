constants
checkerBoardColors

	^ Dictionary new
	at: 0@0 put: Color lightGray;
	at: 1@1 put: Color lightGray;
	at: 0@1 put: Color gray;
	at: 1@0 put: Color gray;
	yourself