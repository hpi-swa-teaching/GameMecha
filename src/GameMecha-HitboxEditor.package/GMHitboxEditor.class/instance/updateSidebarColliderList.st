sidebar
updateSidebarColliderList
	"Updates the sidebar and enumerates the entries."

	| labelBag |
	labelBag := Bag new.
	self sidebarColliderList removeAllMorphs.
	
	"TODO add child of a child logic as soon as groups are implemented"
	self colliderTree children do: [:child | | entry label |
		entry := String new.
		
		label := child symbol.
		entry := label asString.
		
		entry := child colliderType asString, '. ', entry.
		
		labelBag add: label.
		
		self sidebarColliderDictionary at: entry put: child.
		self sidebarColliderList addMorphBack: (TextMorph new contents: entry)]