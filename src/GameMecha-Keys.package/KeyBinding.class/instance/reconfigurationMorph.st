reconfiguration
reconfigurationMorph 
	|border stringMorph reset add|
	self visualization ifNotNilDo: [:vis |^vis].
	"Build a ReconfigurationMorph for this binding"
	reset := SimpleButtonMorph newWithLabel: 'Reset'.
	add := SimpleButtonMorph newWithLabel: 'Add'.
	border := 4.
	self visualization: RectangleMorph new.
	stringMorph := self keyString asMorph.
	self visualization addMorph: stringMorph.
	self visualization addMorph: add.
	self visualization addMorph: reset.
	add position: border asPoint.
	reset position: border asPoint + ((add width + border) @ 0).
	reset target: self.
	reset actionSelector: #resetBindings.
	add target: self.
	add actionSelector: #addNewButtonPrompt.
	stringMorph position: border asPoint + ((add width + reset width + (2 * border)) @ 0).
	self visualization extent: (stringMorph width + add width + reset width + (2 * border) @ add height) + ((border * 2) asPoint).
	^ self visualization.