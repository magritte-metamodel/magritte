reflective operations
doesNotUnderstand: aMessage
  self model magritteDescription children detect: [ :desc | desc isMessage: aMessage selector ] ifFound: [ : desc | ^ self readUsing: desc ].
  ^ super doesNotUnderstand: aMessage