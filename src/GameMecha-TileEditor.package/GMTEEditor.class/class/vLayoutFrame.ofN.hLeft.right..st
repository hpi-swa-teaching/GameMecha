utility
vLayoutFrame: intI ofN: intN hLeft: aFloat right: anotherFloat
	"useful for building buttons, maybe move this to instance? TODO FLAG"
	
	^ LayoutFrame fractions: ((aFloat @ (intI - 1 / intN)) corner: (1 - anotherFloat @ (intI / intN)))