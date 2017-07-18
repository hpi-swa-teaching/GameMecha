instance creation
default: anImports
	"Set my default instance. Returns the old value if any."
	| old |
	old := default.
	default := anImports.
	^old.