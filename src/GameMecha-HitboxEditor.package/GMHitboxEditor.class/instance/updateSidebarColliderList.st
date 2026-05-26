sidebar
updateSidebarColliderList
    "Leert nur den Listen-Bereich und baut ihn neu auf. Die restliche Sidebar bleibt unverändert!"
    
    self sidebarColliderList removeAllMorphs.
    
    self canvasMorph submorphs do: [ :eachCollider |
        | entry |
 
        entry := StringMorph contents: eachCollider class name.
        
        "Füge ihn in unseren gezielten Container ein"
        self sidebarColliderList addMorphBack: entry.
    ].