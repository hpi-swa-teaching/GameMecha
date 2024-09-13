brushHelper
calculateOffsetsForRadius: aRadius
    	
	|offsets|
	offsets := OrderedCollection new.
    	(0-self radius to: self radius) do: [:dx |
        	(0-self radius to: self radius) do: [:dy |
            	((dx squared + dy squared) <= aRadius squared) ifTrue: [offsets add: dx @ dy]]].

	^ offsets