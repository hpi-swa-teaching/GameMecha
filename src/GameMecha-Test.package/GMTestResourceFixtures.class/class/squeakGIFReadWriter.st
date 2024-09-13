animatedImages
squeakGIFReadWriter
 	^ GIFReadWriter formsFromStream: (ReadStream on: self squeakGIFContents base64Decoded asByteArray)