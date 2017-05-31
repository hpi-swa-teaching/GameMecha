highlevel
WASDVector
	"return a point in range [-1, -1] to [1, 1] that represents the current state of the WASD-buttons"
	^ (self keyDownSum: 
	  {#keyW -> (0 @ -1).
		#keyA -> (-1 @ 0).
		#keyS -> (0 @ 1).
		#keyD -> (1 @ 0).}) asPoint.