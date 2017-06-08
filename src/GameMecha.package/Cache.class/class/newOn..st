as yet unclassified
newOn: aDirectory
	"create a new imageCache - object and give it a path to work with (e.g. HOP/res)"
	^ self new
		resourceDirectory: (self parseDirectory: aDirectory);
		yourself.