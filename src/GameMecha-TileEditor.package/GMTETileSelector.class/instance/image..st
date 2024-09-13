accessing
image: anImage

	super image: ((FormCanvas on: (GMTETile checkerBoardTile image scaledToSize: anImage extent))
				image: (anImage)
				at: 0@0
				sourceRect: (anImage boundingBox)
				rule: Form blend)
				form