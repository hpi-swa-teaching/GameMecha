animations
imageAt: imageIndex
	^ self cache getTexture:
		(self spriteNameList at:
			(self transformIndex: imageIndex)).