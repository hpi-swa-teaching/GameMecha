accessing
extent: aPoint	
	(bounds extent closeTo: aPoint) ifTrue: [^ self].
	self changed.
	self privateBounds: (bounds topLeft extent: aPoint).
	self removeProperty: #dropShadow.
	self layoutChanged.
	self changed.

	"Widgets: Emit extent change."
	self extentChanged: aPoint.