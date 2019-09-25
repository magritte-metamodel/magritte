*Magritte-Model
maHashUsing: valuabledescription
	"See isSameAs:using: comments"
	^ valuabledescription value children 
			inject: 0 hash 
			into: [ :hash :desc | hash bitXor: (desc read: self) hash ]