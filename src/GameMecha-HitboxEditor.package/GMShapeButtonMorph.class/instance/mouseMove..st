event handling
mouseMove: evt

	isPressed ifFalse: [^ self].
	"Keep morph tied to Cursor"
	self parachuteMorph: evt