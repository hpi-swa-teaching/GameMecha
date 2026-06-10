drawing
drawMorphOnCanvas: aMorph
	
	aMorph position: self center - aMorph center. 
	self addMorph: aMorph