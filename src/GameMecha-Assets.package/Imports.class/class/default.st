instance creation
default
	"Answer my default instance, creating one if necessary."
	"Imports default"
	^default ifNil: [ default := self new ].