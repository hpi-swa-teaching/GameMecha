utility
hLayoutFrame: intI ofN: intN vUp: aFloat down: anotherFloat
	"useful for building buttons, maybe move this to instance? TODO FLAG"
	
	^ LayoutFrame fractions: ((intI - 1 / intN @ aFloat) corner: (intI / intN @ (1 - anotherFloat)))