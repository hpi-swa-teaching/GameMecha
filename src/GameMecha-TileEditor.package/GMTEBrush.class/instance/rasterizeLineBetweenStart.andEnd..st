brushHelper
rasterizeLineBetweenStart: aStartIndex andEnd: anEndIndex
	"implementation of Bresenhams Line Algorithm"
	
	| lineIndexCollection deltaX deltaY stepX stepY error error2 x y index |
	
    	deltaX := (anEndIndex x - aStartIndex x) abs.
    	deltaY := (anEndIndex y - aStartIndex y) abs.
    	stepX := (aStartIndex x < anEndIndex x) ifTrue: [1] ifFalse: [-1].
    	stepY := (aStartIndex y < anEndIndex y) ifTrue: [1] ifFalse: [-1].
    	error := deltaX - deltaY.
    	x := aStartIndex x.
    	y := aStartIndex y.

    	lineIndexCollection := OrderedCollection new.

    	[	index := x @ y.
		lineIndexCollection add: index.
        	(x = anEndIndex x and: [y = anEndIndex y]) ifTrue: [^ lineIndexCollection].
        	error2 := 2 * error.
        	(error2 > (0 - deltaY)) ifTrue: [
            	error := error - deltaY.
            	x := x + stepX].
        	(error2 < deltaX) ifTrue: [
            	error := error + deltaX.
            	y := y + stepY]] repeat
