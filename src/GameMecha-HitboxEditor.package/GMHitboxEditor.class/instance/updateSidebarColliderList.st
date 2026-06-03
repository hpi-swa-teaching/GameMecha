sidebar
updateSidebarColliderList
	"Updates the sidebar and enumerates the entries."

	| labelBag |
	labelBag := Bag new.
	self sidebarColliderList removeAllMorphs.
	
	self colliderTree children do: [:aCollider | | entry occurence label |
		entry := String new.
		
		label := aCollider symbol.
		entry := label asString.
		
		occurence := 1 + (labelBag occurrencesOf: entry).
		entry := occurence asString, '. ', entry.
		
		labelBag add: label.
		
		self sidebarColliderList addMorphBack: (TextMorph new contents: entry)]