as yet unclassified
preLoad: unused1 package: unused2

	MCConfiguration ensureOpenTranscript: false.
	[MCMcmUpdater default doUpdate: false]
		ensure: [MCConfiguration ensureOpenTranscript: true].