"
A GMAnimatedImageLoader can handle and store (animated) gif images in a cache. It returns Readers which than can be used to construct an AnimatedImageMorph (see AnimatedImageMorph).
"
Class {
	#name : #GMAnimatedImageLoader,
	#superclass : #GMResourceLoader,
	#category : #'GameMecha-ResourceLoading',
	#'squeak_changestamp' : 'NK 7/24/2018 15:44'
}

{
	#category : #loading,
	#'squeak_changestamp' : 'mt 10/19/2023 14:14'
}
GMAnimatedImageLoader >> isSupportedType: aFileExtension [
	^ GIFReadWriter typicalFileExtensions includes: aFileExtension
]

{
	#category : #loading,
	#'squeak_changestamp' : 'mt 10/19/2023 14:14'
}
GMAnimatedImageLoader >> resourceFromDrive: aFilename [
	^ GIFReadWriter formsFromFileNamed: aFilename
]

{
	#category : #storing,
	#'squeak_changestamp' : 'ek 9/13/2024 14:33'
}
GMAnimatedImageLoader >> stringFromFile: aFilename [
	^ (WriteStream on: '') 
		nextPutAll: ' GIFReadWriter formsFromStream: (ReadStream on: ';
		store: (self contentsFromFile: aFilename);
		nextPutAll: ' base64Decoded asByteArray)';
		contents
]
