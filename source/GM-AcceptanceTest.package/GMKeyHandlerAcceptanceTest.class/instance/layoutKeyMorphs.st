layout
layoutKeyMorphs
	self adaptExtent.
	self color: Color white.
	(0 to: self keyMorphs size - 1) do: [:number |
		(self keyMorphs at: number + 1) position: 
			(number \\ self class keysPerRow * self keyMorphsWidth) @ 
			(number // self class keysPerRow * self keyMorphsHeight)].