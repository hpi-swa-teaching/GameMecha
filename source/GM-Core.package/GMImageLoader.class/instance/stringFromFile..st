storing
stringFromFile: aFilename
	
	^ String streamContents: [:stream | | pngContents |
		stream << 'PNGReadWriter formFromStream: (Base64MimeConverter mimeDecodeToBytes:'.
		pngContents := ByteArray streamContents: [:pngStream |
			PNGReadWriter 
				putForm: (self resourceFromDrive: aFilename)
				onStream: pngStream].
		stream << '''' << pngContents base64Encoded << ''''.
		stream << ' readStream'.
		stream << ')'.]