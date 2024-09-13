highlighting
applyDecoMorphHighlighting: aForm
	"Set a form as a temporary decoration inside the tile"	

	| newDecoMorph |
	aForm 
		ifNotNil: [
			newDecoMorph := (ImageMorph new)
				bounds: self bounds;
				image: (aForm scaledToSize: self extent);
				yourself]
		ifNil: [
			newDecoMorph := Morph new
				bounds: self bounds;
				color: (Color black alpha: GMTETileHighlighting decoMorphAlphaValue);
				yourself].

	self 
		addMorph: newDecoMorph;
		decorationMorph: newDecoMorph