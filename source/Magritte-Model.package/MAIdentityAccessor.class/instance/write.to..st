model
write: anObject to: aModel 
	MAWriteError signal: 'Not supposed to write to ' , aModel greaseString , '.'