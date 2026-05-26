mousebehaviour
mouseMove: anEvent
    | newPos |
    "Wenn nichts angeklickt wurde, mach nichts"
    activeMorph ifNil: [ ^ self ].
    
    newPos := anEvent position - dragOffset.
    
    "Die Form strikt innerhalb des Canvas einsperren"
    newPos := newPos max: self bounds topLeft.
    newPos := newPos min: self bounds bottomRight - activeMorph extent.
    
    activeMorph position: newPos.