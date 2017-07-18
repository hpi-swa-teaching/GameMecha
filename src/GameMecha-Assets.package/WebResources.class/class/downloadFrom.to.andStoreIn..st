as yet unclassified
downloadFrom: url to: localPath andStoreIn: cache
	"use WebClient to create a http-connection and download the contents of an url to a file"
	|resp wc out|
	wc := WebClient new. 
	[
		resp := wc httpGet: (self preprocessUrl: url).
		self deleteIfExists: localPath.
		out := (self getFileStreamFor: localPath) binary.
		cache ifNotNilDo: 
			[cache save: out from: localPath].
		resp streamTo: out size: resp contentLength progress: [:t :c].
	] ensure: [wc close].