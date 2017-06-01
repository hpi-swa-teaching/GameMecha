highlevel
arrowKeyVector
	"return a point in range [-1, -1] to [1, 1] that represents the
	current state of the arrow key buttons"
	^ (self keyDownSum: 
	  {#keyArrowUp -> (0 @ -1).
		#keyArrowLeft -> (-1 @ 0).
		#keyArrowDown -> (0 @ 1).
		#keyArrowRight -> (1 @ 0).}) asPoint.