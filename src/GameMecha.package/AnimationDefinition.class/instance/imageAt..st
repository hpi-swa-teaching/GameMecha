animations
imageAt: imageIndex
	^ self cache 
		getSprite: self spritePath 
		atIndex: (self transformIndex: imageIndex).