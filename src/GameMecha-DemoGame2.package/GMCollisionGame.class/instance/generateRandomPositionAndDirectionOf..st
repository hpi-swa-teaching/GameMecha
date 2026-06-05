game logic
generateRandomPositionAndDirectionOf: aMorph

	| width height side xOffset yOffset dist |
	width := self extent x / 2.
	height := self extent y / 2.
	
	dist := 50px.
	side := #(#top #bottom #left #right) atRandom.
	
	xOffset := (Random new nextInt: width * 2) - width.
	yOffset := (Random new nextInt: height * 2) - height.
	
	aMorph position: self center + (side caseOf: {
		[#top] -> [xOffset @ (height + dist)].
		[#bottom] -> [xOffset @ (height + dist) negated].
		[#left] -> [(width + dist) negated @ yOffset].
		[#right] -> [width + dist @ yOffset]}).
	aMorph direction: (side caseOf: {
		[#top] -> [0 @ -1].
		[#bottom] -> [0 @ 1].
		[#left] -> [1 @ 0].
		[#right] -> [-1 @ 0]})