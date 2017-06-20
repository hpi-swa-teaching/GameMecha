as yet unclassified
fromSpriteSheet: path on: cache withDimensions: dimensions
	|instance|
	cache loadSpriteSheet: path withDimensions: dimensions.
	instance := self new.
	instance cache: cache.
	1 to: dimensions y do:
		[:i  | 1 to: dimensions x do:
			[:o | instance spriteNameList add:( path, '_', o, '_', i)]].
	
	^ instance.