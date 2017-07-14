as yet unclassified
initializeImage: imageName
	self borderWidth: 0.
	self imports getTexture: imageName andDo: [:form | 
		self transform: 
			(form 
				magnify: form boundingBox 
				by: (self bounds extent / form extent))].