sidebar
updateSidebarColliderList
    "Leert nur den Listen-Bereich und baut ihn neu nummeriert auf. Die restliche Sidebar bleibt unverändert!"
    |nameBag|

	nameBag := Bag new. 
    	self sidebarColliderList removeAllMorphs.
    
    	self canvasMorph submorphs do: [ :aCollider |
        | entry occurence label|

 	entry := String new. 
	
	label := aCollider class name.
       entry :=  label asString.
	occurence := 1 +  (nameBag occurrencesOf: entry).
	entry := (occurence asString) , '. ', entry.	
	
	nameBag add: label.

        "Füge ihn in unseren gezielten Container ein"
        self sidebarColliderList addMorphBack: (TextMorph new contents: entry).
    ].