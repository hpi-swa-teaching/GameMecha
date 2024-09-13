initialization
initializeBrush
	"Necessary so the button knows it is selected"
	
	self 
		brush: GMTEBrush new;
		selectRadiusBrush;
		changed: #getBrushRadiusAsString