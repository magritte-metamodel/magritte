versions
version350: spec
  <version: '3.5.0' imports: #('3.3-baseline')>
  spec
    for: #'common'
    do: [ 
      spec blessing: #'development'.
      spec description: '-[Feature]: Meta-describe GT presentations https://github.com/magritte-metamodel/magritte/issues/26
- [ENH]: Provide hook to initialize ToMany Instances https://github.com/magritte-metamodel/magritte/issues/18
- [ENH]: Actions; fill out a few dark corners
- [BUG]: Hack to make ToOne Morphs work i.e. stop infinite recursion, by duplicating ToMany logic (for now). https://github.com/magritte-metamodel/magritte/issues/25
- [Bug]: MAMemoMorph - respect #readonly of description by disabling editing ability
- [Bug]: In MAElementMorph>>string:, do not silently swallow read errors
- [BUG]: MADateMorph - when building, set value before display block; unfortunately, I don''t remember why that was important, but I ran into a problem the other way.
- [Clean]: Import action button construction, which had been mistakenly put in Model package
- [BUG]: Hack to make ToOne Morphs work i.e. stop infinite recursion, by duplicating ToMany logic (for now). https://github.com/magritte-metamodel/magritte/issues/25'.
      spec author: 'SeanDeNigris'.
      spec timestamp: '08/20/2015 10:51'.
      spec
        project: 'Grease' with: #'release1.2';
        project: 'Seaside3' with: #'release3.1'.
      spec
        package: 'Magritte-Model' with: 'Magritte-Model-SeanDeNigris.465';
        package: 'Magritte-Tests-Model'
          with: 'Magritte-Tests-Model-DiegoLont.38';
        package: 'Magritte-Seaside'
          with: 'Magritte-Seaside-EstebanMaringolo.359';
        package: 'Magritte-Deprecated' with: 'Magritte-Deprecated-NickAger.7' ].
  spec
    for: #'squeakCommon'
    do: [ 
      spec
        package: 'Magritte-Tests-Pharo-Model'
          with: 'Magritte-Tests-Pharo-Model-lr.4';
        package: 'Magritte-Pharo-Seaside' with: 'Magritte-Pharo-Seaside-lr.5';
        package: 'Magritte-Morph' with: 'Magritte-Morph-SeanDeNigris.95';
        package: 'Magritte-Pharo-Tools' with: 'Magritte-Pharo-Tools-NickAger.3' ].
  spec
    for: #'squeak'
    do: [ spec package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-NickAger.26' ].
  spec
    for: #(#'pharo1.x' #'pharo2.x')
    do: [ spec package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-DiegoLont.39' ].
  spec
    for: #(#'pharo3.x' #'pharo4.x' #'pharo5.x')
    do: [ spec package: 'Magritte-Pharo3-Model' with: 'Magritte-Pharo3-Model-JohnCBorden.4' ].
  spec
    for: #(#'pharo4.x')
    do: [ 
			spec
        project: 'MagritteGlamourForPharo40' with: '1.0'.
			spec package: 'Magritte-GT' with: 'Magritte-GT-SeanDeNigris.5' ].
  spec
    for: #'gemstone'
    do: [ 
      spec project: 'GsCore' with: '0.242'.
      spec
        package: 'Magritte-GemStone-Model'
          with: 'Magritte-GemStone-Model-dkh.4';
        package: 'Magritte-Tests-GemStone-Model'
          with: 'Magritte-Tests-GemStone-Model-DaleHenrichs.1';
        package: 'Magritte-GemStone-Seaside'
          with: 'Magritte-GemStone-Seaside-DaleHenrichs.2' ]