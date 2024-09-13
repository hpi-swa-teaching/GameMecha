helper
getFileWithFileChooser
	"Opens a file chooser which allows the user to select a morph file"
	
	^ UIManager default chooseFileMatchingSuffixes: {'morph'}