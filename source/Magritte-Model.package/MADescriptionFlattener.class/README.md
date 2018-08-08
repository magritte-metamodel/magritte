MADescriptionFlattener  builds from a description with references to single objects a description, that is more flat. This allows us to render these descriptions, without "cluttered" labels. I.E. a nested description (MAInternalEditor) would render two labels: one for the "main" object and one for the "fields" in that object. Replacing a MAInternalEditor would not help, since this would not replace the label in front of this editor.

This description is used in a QCMultipartComponent and this is extracted since, visiting gives us more elegant code for this "complex" behaviour.
