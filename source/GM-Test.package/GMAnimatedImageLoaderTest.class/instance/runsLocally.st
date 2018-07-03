as yet unclassified
runsLocally
	"gifs cannot be stored in methods and written on disk so the test checks only locally"
	"other functionalities are tested in imageLoaderTest"
	^ FileDirectory default directoryExists: 'testingResourcesLocal'