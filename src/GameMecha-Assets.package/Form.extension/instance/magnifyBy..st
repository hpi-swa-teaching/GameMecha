*GameMecha-Assets
magnifyBy: scale 
	"Answer a Form created as a scaling of the receiver.
	Scale may be a Float or even a Point, and may be greater or less than 1.0."

	^ self magnify: self boundingBox by: scale
			smoothing: (scale < 1 asPoint ifTrue: [2] ifFalse: [1]).