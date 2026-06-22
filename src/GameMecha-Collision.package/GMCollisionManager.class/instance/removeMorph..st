accessing
removeMorph: aMorph

	self morphs remove: aMorph ifAbsent: [self error: 'The morph has not been registered for collision detection.'].