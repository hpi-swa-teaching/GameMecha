as yet unclassified
download: url to: localPath
	"use WebClient to create a http-connection and download the contents of an url to a file"
	|resp wc out|
	wc := WebClient new. 
	[
		resp := wc httpGet: url.
		self deleteIfExists: localPath.
		out := (self getFileStreamFor: localPath) binary.
		resp streamTo: out size: resp contentLength progress: [:t :c].
	] ensure: [wc close].