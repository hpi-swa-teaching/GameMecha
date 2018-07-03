history
lastStoredRun
	^ ((Dictionary new) add: (#errors->((Set new) add: #testLoadAll; yourself)); add: (#passed->((Set new) add: #testAnimatedImageLoading; add: #testFlushCache; add: #testLoadAllWithoutEndings; yourself)); add: (#failures->((Set new))); add: (#timeStamp->'3 July 2018 8:03:53 pm' asTimeStamp); yourself)