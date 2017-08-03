transformation
initializeImage: imageName
	self borderWidth: 0.
	self imports get: imageName andDo: [:image | self finalizeLoadingWith: image].