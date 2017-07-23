accessing
buildButtonsWith: builder
	| panelSpec buttonSpec|
	""
	panelSpec := builder pluggablePanelSpec new.
	panelSpec children: OrderedCollection new.
	
	buttonSpec := builder pluggableActionButtonSpec new.
	buttonSpec model: self.
	buttonSpec label: 'Add Binding'.
	buttonSpec action: #addBinding.
	panelSpec children add: buttonSpec.
	
	buttonSpec := builder pluggableActionButtonSpec new.
	buttonSpec model: self.
	buttonSpec label: 'Remove Bindings'.
	buttonSpec action: #removeBinding.
	panelSpec children add: buttonSpec.
	
	panelSpec layout: #vertical. "buttons"
	
	^panelSpec.