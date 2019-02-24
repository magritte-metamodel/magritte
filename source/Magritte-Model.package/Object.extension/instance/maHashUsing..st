*Magritte-Model
maHashUsing: valuabledescription
	"See isSameAs:using: comments"
	^ valuabledescription children 
			inject: 0 hash 
			into: [ :hash :desc | hash bitXor: (desc read: self) hash ]