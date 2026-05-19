accessing
maskIncludes: aLayersCollection

	^ self mask anySatisfy: [:maskEntry | aLayersCollection includes: maskEntry]