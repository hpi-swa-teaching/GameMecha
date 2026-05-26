mousebehaviour
mouseDown: anEvent
"Hier wird implementiert, dass die Morphs Drag&Drop nicht selbst implementieren müssen."
    
    activeMorph := self submorphs 
        detect: [ :each | each containsPoint: anEvent position ] 
        ifNone: [ nil ].
        
    activeMorph ifNotNil: [
        "Abstand merken, damit die Form nicht zur Maus springt"
        dragOffset := anEvent position - activeMorph position.
        
        self addMorphFront: activeMorph.
    ].