accessing
magritteDescription
	"By default the we read it via the #description selector"
	^ magritteDescription ifNil: [ magritteDescription := #magritteDescription ]