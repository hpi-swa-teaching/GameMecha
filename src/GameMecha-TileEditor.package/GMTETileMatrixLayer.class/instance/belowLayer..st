comparing
belowLayer: aLayer
	"Check if self is logically beneath aLayer"

	^ (self aboveLayer: aLayer) not