# Usage:  praat extractFormants.praat filename.wav nFormants maxFormant windowSize preEmphasis
# Example: praat extractFormants.praat test.wav 5 5500 0.025 50

form Get_arguments
  word audioFile
  integer nFormants
  integer maxFormant
  real windowSize
  integer preEmphasis
endform

Read from file... 'audioFile$'

To Formant (burg)... 0.0 'nFormants' 'maxFormant' 'windowSize' 'preEmphasis'

Get mean: 1, 0, 0, "Hertz"
