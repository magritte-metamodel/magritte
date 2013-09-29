I manage the file-data I represent on the file-system. From the programmer this looks the same as if the file would be in memory (==*MAMemoryFileModel*==), as it is transparently loaded and written out as necessary.

I delegate my actual location on disk to MAFileDatabase (see class comment).