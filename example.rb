# *** Documentation and sources for inspiration: ***
# https://cloud.google.com/speech/
# https://cloud.google.com/speech/docs/
# https://cloud.google.com/speech/docs/encoding
# https://cloud.google.com/speech/docs/best-practices
# https://cloud.google.com/speech/reference/rest/v1/RecognitionConfig

# https://github.com/GoogleCloudPlatform/google-cloud-ruby
# gem install google-cloud

# https://github.com/GoogleCloudPlatform/google-cloud-ruby#cloud-speech-api-alpha
# gem install google-cloud-speech

# https://github.com/GoogleCloudPlatform/google-cloud-ruby/blob/master/google-cloud-speech/README.md

# https://cloud.google.com/sdk/  installing the SDK
# The google SDK folder is ignored. You have to install it yourself.

# https://cloud.google.com/ruby/
# https://developers.google.com/accounts/docs/application-default-credentials
# https://github.com/GoogleCloudPlatform/ruby-docs-samples

# You have to set the GOOGLE_APPLICATION_CREDENTIALS
# export GOOGLE_APPLICATION_CREDENTIALS = "name of project file from google cloud.json"
# google-auth-library-ruby

# Imports the Google Cloud client library
require "google/cloud/speech"
require 'googleauth'
scopes =  ['https://www.googleapis.com/auth/cloud-platform', 'https://www.googleapis.com/auth/cloud-platform.read_only']
authorization = Google::Auth.get_application_default(scopes)
# If your google authentication is not OK, you will get an error at this point.
# Check that you have downloaded the json from from Google and that your environment variable is in place.
# type env in the terminal and look for GOOGLE_APPLICATION_CREDENTIALS

# Your Google Cloud Platform project ID
project_id = "helical-realm-174315" # has to be replaced by your project id.

# Instantiates a client
speech = Google::Cloud::Speech.new project: project_id

# THE FOLLOWING EXAMPLE WORKS ---------------------------
# file_name = 'hello (16bit PCM).wav'
# audio = speech.audio(file_name, encoding:    :linear16,
#                                 sample_rate: 16000,
#                                 language:    'en-US')
# Transcription: 'hello Google' Confidence: 98.8%
# -------------------------------------------------------

# THE FOLLOWING EXAMPLE WORKS ---------------------------
# file_name = "audio.raw"
# audio = speech.audio(file_name, encoding:    :linear16,
#                                 sample_rate: 16000,
#                                 language:    'en-US')
# Transcription: 'how old is the Brooklyn Bridge' Confidence: 98.8%
# -------------------------------------------------------

# THE FOLLOWING EXAMPLE WORKS ---------------------------
# source http://www.signalogic.com/index.pl?page=codec_samples
# file_name = 'female.wav'
# audio = speech.audio(file_name, encoding:    :linear16,
#                                 sample_rate: 8000,
#                                 language:    "en-US")
# Transcript: "Perhaps this is what gives the aborigine his honor of dignity turbulent towards rose as much as 50 feet in the choreographer must arbitrate. He did not however settle back into Acquia since with things as they were he finds it in error Misery and desolation ironically enough and this instant such personal virtues were a luxury who other cases also. We're under advisement say he is the horsethief runs and oel edit. He may have a point in urging that deck and things be given fewer prizes the straight line would symbolize it's uniqueness the circle at universe ality Phil small hole in Bowl with clay it has multiple implications and possible headache spear marketing program the manufacture of taking initiative and point the other costs involved crooked overlapping twisted, or widely space. Do you always navigate like this?",
# Confidence: 65.4%
# -------------------------------------------------------

# THE FOLLOWING EXAMPLE WORKS ---------------------------
# source http://www.signalogic.com/index.pl?page=codec_samples
file_name = 'f_f.wav'
audio = speech.audio(file_name, encoding:    :linear16,
                                sample_rate: 8000,
                                language:    "fr-fr")
# Transcription: 'Sabine le soleil se disputer chacun assuré qu'il était le plus fort quand ils virent un voyageur s'avancer enveloppé dans son manteau ils tombèrent d'accord que celui qui arriverait le manteau serait le plus fort alors l'habitat soufflet de toutes ses forces'
# Confidence: 91.9%
# -------------------------------------------------------

# Detects speech in the audio file
results = audio.recognize
result  = results.first

puts results.first.class
puts "Transcription: '#{result.transcript}' Confidence: #{(result.confidence * 100).round(1)}%"

