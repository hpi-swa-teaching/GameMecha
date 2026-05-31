mousebehaviour
mouseDown: anEvent
"this implements, that morphs on the canvas can be moved with a click. Otherwise they would have to implement that themself"
    
	activeMorph := self submorphs 
        detect: [ :each | each containsPoint: anEvent position ] 
        ifNone: [ nil ].
        
   	activeMorph ifNotNil: [
      
	"Differnce between where we clicked and where the pos of the moprh ist. We need that later, when the morph is moved"
	dragOffset := anEvent position - activeMorph position.
        
        self addMorphFront: activeMorph.
    ].