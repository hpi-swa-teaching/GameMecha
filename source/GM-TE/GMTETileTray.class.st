Class {
	#name : #GMTETileTray,
	#superclass : #AlignmentMorph,
	#category : #'GM-TE-UI'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'jj 6/23/2024 17:39'
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
