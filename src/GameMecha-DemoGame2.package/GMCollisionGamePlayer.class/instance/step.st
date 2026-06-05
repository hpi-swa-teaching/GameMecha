stepping and presenter
step

	super step.
	self
		handleInput;
		move;
		rotation: self rotation + 0.1;
		shootTimer: self shootTimer + 1