"
A GMImageLoader can handle images. It returns Forms and supports all typical file extensions.
"
Class {
	#name : #GMImageLoader,
	#superclass : #GMResourceLoader,
	#category : #'GameMecha-ResourceLoading',
	#'squeak_changestamp' : 'NK 7/24/2018 15:44'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'brh 7/3/2018 22:15'
}
GMImageLoader >> at: aString withSize: aPoint [
	^ (self at: aString) scaledIntoFormOfSize: aPoint
]

{
	#category : #loading,
	#'squeak_changestamp' : 'AZ 7/15/2018 17:37'
}
GMImageLoader >> isSupportedType: aFileExtension [
	^ ImageReadWriter allTypicalFileExtensions includes: (aFileExtension asLowercase)
]

{
	#category : #loading,
	#'squeak_changestamp' : 'brh 7/15/2018 00:26'
}
GMImageLoader >> resourceFromDrive: aFilename [
	^ Form fromFileNamed: (FileDirectory uri: aFilename) fullName
]

{
	#category : #storing,
	#'squeak_changestamp' : 'brh 7/15/2018 01:07'
}
GMImageLoader >> stringFromFile: aFilename [
	| sourceTemplate base64EncodedContent file |
	sourceTemplate := '(Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: ''{1}'' readStream))'.

	file := FileStream readOnlyFileNamed: aFilename.
	base64EncodedContent := (Base64MimeConverter mimeEncode: file binary) contents.
	
	^ sourceTemplate format: {base64EncodedContent}

]
