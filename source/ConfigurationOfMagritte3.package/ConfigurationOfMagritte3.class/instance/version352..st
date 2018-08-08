versions
version352: spec
  <version: '3.5.2' imports: #('3.5-baseline')>
  spec
    for: #'common'
    do: [ 
      spec blessing: #'development'.
      spec author: 'topa'.
      spec timestamp: '17/11/2017 23:38'.
      spec description: 'Split out Trait extensions FileSystem/Directory detection and load only when supported.
- Traits are supporten in Pharo and Squek (but only when loaded).
- FileSystem is in all newer Pharo but could be loaded in Pharo 1.0 and Squeak, GemStone and Squeak have FileDriectory by default'.
      spec
        project: 'Grease' with: #'release1.2';
        project: 'Seaside3' with: #'release3.2'.
      spec
        package: 'Magritte-Model' with: 'Magritte-Model-topa.474';
        package: 'Magritte-Tests-Model'
          with: 'Magritte-Tests-Model-topa.41';
        package: 'Magritte-Seaside'
          with: 'Magritte-Seaside-DiegoLont.360';
        package: 'Magritte-Deprecated' with: 'Magritte-Deprecated-NickAger.7';
        package: 'Magritte-Files-Model' with: 'Magritte-Files-Model-topa.1'; 
        package: 'Magritte-Tests-Files-Model' with: 'Magritte-Tests-Files-Model-topa.1';
        package: 'Magritte-FileDirectory' with: 'Magritte-FileDirectory-topa.1'; 
        package: 'Magritte-FileSystem' with: 'Magritte-FileSystem-topa.2';
        yourself ].
  spec
    for: #'squeakCommon'
    do: [ 
      spec
        package: 'Magritte-Pharo-Seaside' with: 'Magritte-Pharo-Seaside-lr.5';
        package: 'Magritte-Morph' with: 'Magritte-Morph-SeanDeNigris.99';
        package: 'Magritte-Pharo-Tools' with: 'Magritte-Pharo-Tools-NickAger.3' ].
  spec
    for: #(#'squeak' #'pharo1.x' #'pharo2.x')
    do: [ spec package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-topa.40' ].
  spec
    for: #(#'pharo3.x' #'pharo4.x' #'pharo5.x' #'pharo6.x' #'pharo7.x')
    do: [
	spec
		package: 'Magritte-FileSystem' with: 'Magritte-FileSystem-topa.1'; "Do not change. is empty"
		package: 'Magritte-Pharo3-Model' with: 'Magritte-Pharo3-Model-JohnCBorden.4' ].
  spec
    for: #(#'pharo4.x')
    do: [ 
			spec
        project: 'MagritteGlamourForPharo40' with: '1.0'.
			spec package: 'Magritte-GT' with: 'Magritte-GT-SeanDeNigris.5' ].
  spec
    for: #'MagritteWithTraits'
    do: [ spec package: 'Magritte-Traits-Model' with: 'Magritte-Traits-Model-topa.2' ].
  spec
    for: #'gemstone'
    do: [ 
      spec project: 'GsCore' with: '0.242'.
      spec
        package: 'Magritte-GemStone-Model'
          with: 'Magritte-GemStone-Model-topa.5';
        package: 'Magritte-GemStone-Seaside'
          with: 'Magritte-GemStone-Seaside-DaleHenrichs.2' ]