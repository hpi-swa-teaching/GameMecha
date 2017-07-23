displaying
displayOn: anImageMorph
	"displays the current image of this Animation onto an ImageMorph (or something that understands #image and #image: )"
	|currentImage|
	currentImage := self currentImage.
	anImageMorph image == currentImage
		ifFalse: [anImageMorph image: currentImage].