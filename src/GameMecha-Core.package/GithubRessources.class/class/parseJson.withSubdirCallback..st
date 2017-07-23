as yet unclassified
parseJson: jsonString withSubdirCallback: callback
"retruns a list of files"
| ret json |
ret := Dictionary new.
json := (Json newWithConstructors: {Object.}) readFrom: jsonString readStream.
json do: [:o | 
	((o at: 'type') = 'dir') ifTrue: [callback value: (o at:'url').]
	ifFalse: [(o at: 'download_url') ifNotNil: [ret at: (o at: 'path') ifAbsentPut: (o at: 'download_url')]]].
^ ret.