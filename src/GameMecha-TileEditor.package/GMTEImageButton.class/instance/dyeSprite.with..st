visual properties
dyeSprite: anImage with: aColor

	^ anImage copy
		replaceColor: Color white withColor: Color transparent;
		dyed: aColor