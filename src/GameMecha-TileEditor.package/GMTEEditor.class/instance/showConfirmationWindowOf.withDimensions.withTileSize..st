file loading
showConfirmationWindowOf: morphArray withDimensions: aPoint withTileSize: aNumber
	"Shows a preview window for an imported tileset"
	

	|img imgWrapper dialog dialogExtent|
	imgWrapper := ScrollPane new.
	img := Morph new
		beTransparent;
		extent: aPoint;
		yourself.
	(img layoutPolicy: TableLayout new)
	listDirection: #leftToRight;
	wrapDirection: #leftToRight.
	
	(morphArray reversed) do: [:morph| 
		img 
			addMorph: (ImageMorph new image: (morph image scaledToWidth: aNumber); 			
			borderColor: (Color red);
			borderWidth:1;
			yourself)].
	
	dialogExtent := GMTEEditor maximumPreviewTilesetWindowExtent.
	imgWrapper extent: (img width min: dialogExtent x) @ (img height min: dialogExtent y). "TODO: is this a magic number we want to get rid off?"
	imgWrapper scroller addMorph: img.

	dialog := DialogWindow new
		title: 'Preview';
		message: 'Import Tileset?';
		addPaneMorph: imgWrapper;
		createButton: 'Yes' translated value: true;
		createCancelButton: 'No' translated  value: false;
		selectedButtonIndex: 1; "YES"
		registerKeyboardShortcuts.
	dialog paneMorph extent: imgWrapper extent.
	
	^ dialog getUserResponseAtHand