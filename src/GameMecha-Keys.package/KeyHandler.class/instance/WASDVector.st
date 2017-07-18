highlevel
WASDVector
	"return a point in range [-1, -1] to [1, 1] that represents the
	current state of the WASD-buttons"
	^ (self keyDownSum: 
	  {$w -> (0 @ -1).
		$a -> (-1 @ 0).
		$s -> (0 @ 1).
		$d -> (1 @ 0).}) asPoint.