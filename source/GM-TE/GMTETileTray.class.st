Class {
	#name : #GMTETileTray,
	#superclass : #AlignmentMorph,
	#category : #'GM-TE-UI'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Alex M 6/14/2024 01:19'
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
