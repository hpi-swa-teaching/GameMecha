transformation
initializeImage: imageName fromCache: cache
	self borderWidth: 0.
	cache getTexture: imageName andDo: [:form | 
		self transform: 
			(form 
				magnify: form boundingBox 
				by: (self bounds extent / form extent))].