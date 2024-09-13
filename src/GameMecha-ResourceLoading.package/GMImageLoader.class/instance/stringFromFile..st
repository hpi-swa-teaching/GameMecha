storing
stringFromFile: aFilename
	| sourceTemplate base64EncodedContent file |
	sourceTemplate := '(Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: ''{1}'' readStream))'.

	file := FileStream readOnlyFileNamed: aFilename.
	base64EncodedContent := (Base64MimeConverter mimeEncode: file binary) contents.
	
	^ sourceTemplate format: {base64EncodedContent}
