images
viewImages
	"Open up a special Form inspector on the dictionary of graphical imports."
	"Imports default viewImages"

	imports size isZero ifTrue:
		[^ self inform: 
'The ImageImports repository is currently empty,
so there is nothing to view at this time.  You can
use a file list to import graphics from external files
into Imports, and once you have done that,
you will find this command more interesting.'].
	
	Project current formViewClass openOn:  imports withLabel: 'Graphical Imports'.