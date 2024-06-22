Class {
	#name : #GMTETileTray,
	#superclass : #AlignmentMorph,
	#category : #'GM-TE-UI'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 6/22/2024 14:57'
}
GMTETileTray >> initialize [

	super initialize.
	self
		layoutInset: (10@10);
		cellInset: (10@10);
		listDirection: #leftToRight;
		wrapCentering: #center;
		hResizing: #spaceFill; vResizing: #spaceFill;
		color: Color transparent
]
