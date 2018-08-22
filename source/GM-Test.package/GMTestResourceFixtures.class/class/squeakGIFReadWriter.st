animatedImages
squeakGIFReadWriter
 	^ AnimatedGIFReadWriter formsFromStream: (ReadStream on: self squeakGIFContents base64Decoded asByteArray)