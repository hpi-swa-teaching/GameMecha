geometry
extent: aPoint	
	"this is roughly the code of Morph>>extent:"
	"(to bypass ImageMorphs tenacity to new extents)"
	(bounds extent closeTo: aPoint) ifTrue: [^ self].
	self changed.
	self privateBounds: (bounds topLeft extent: aPoint).
	self removeProperty: #dropShadow.
	self layoutChanged.
	self changed.