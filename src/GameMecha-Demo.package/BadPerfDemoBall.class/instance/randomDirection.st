accessing
randomDirection
	self speed: (Random new next) * 10.
	self direction: ((Random new next - 0.5)@(Random new next - 0.5)).