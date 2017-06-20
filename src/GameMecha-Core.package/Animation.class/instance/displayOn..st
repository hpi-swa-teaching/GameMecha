accessing
displayOn: anImageMorph
	"TODO - only update the image if it is needed (for performance)"
	|currentImage|
	currentImage := self currentImage.
	anImageMorph image == currentImage
		ifFalse: [anImageMorph image: currentImage].