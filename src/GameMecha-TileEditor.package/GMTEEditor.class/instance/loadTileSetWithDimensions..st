file loading
loadTileSetWithDimensions: aPoint
	"loads a tile set with given tile dimensions"
	"The source argument is mostly for debugging. Make it nicer with objects"
	"Do we really leaves this here or do we create an extra class for"
 
	| fc stream form tile tileWidth tileHeight image morphs previewDimensions previewTileSize alreadyImported previews |
	fc := FileChooser new.
	fc initializeAsSystemWindowWithCaptionPane.
	fc setCaption: 'Select an image file' translated.
	fc setSuffixes: {'png' . 'gif' . 'bmp' . 'jpg' . 'jpeg' }.
	stream := fc open.
	
	stream ifNil: [^ nil].
	
	form := Form fromBinaryStream: stream.
	
	morphs := OrderedCollection new.
	previews := OrderedCollection new.
	alreadyImported := Set new.
	
	tileWidth := aPoint x.
	tileHeight := aPoint y.
	
	0 to: (form height - tileHeight) by: tileHeight do: [:y |
		0 to: (form width - tileWidth) by: tileWidth do: [:x |
			tile := form contentsOfArea: (Rectangle origin: x @ y extent: tileWidth @ tileHeight).
			image := GMTETileSelector new
				updateSprite: tile;
				borderColor: Color orange;
				borderWidth: 1;
				model: self.
			(alreadyImported includes: image imageForm bits hash)
				ifFalse: [alreadyImported add: image imageForm bits hash.
					morphs add: image].
			previews add: ((ImageMorph new) image: tile)]].
	
	previewTileSize := (form width max: 500) / (form width / tileWidth).
	previewDimensions := (form extent / aPoint * previewTileSize) + (2 * ((form width / tileWidth) @ (form height / tileHeight))).
	
	(self showConfirmationWindowOf: previews withDimensions: previewDimensions withTileSize: previewTileSize) ifFalse:[^ nil].

	^ morphs