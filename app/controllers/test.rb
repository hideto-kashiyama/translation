# Synthesizes speech from the input string of text or ssml.
# Note: ssml must be well-formed according to:
# https://www.w3.org/TR/speech-synthesis/

require "google/cloud/text_to_speech"

#SPEECH_PROJECT = "gtts-218304" 
#GOOGLE_API_KEY="AAIzaSyBsj4o6xzGP7lj1xugYftAzl67fn4cc_Vk"


#プロジェクト ID
#SPEECH_KEYFILE = "gtts-218304-d4119e3a58da.json"  
#"サービスアカウントキーのjsonファイルのパス"

# Instantiates a client
client = Google::Cloud::TextToSpeech.new project: "gtts-218304", keyfile: "gtts-218304-d4119e3a58da.json"

# Set the text input to be synthesized
synthesis_input = { text: "Hello, World!" }

# Build the voice request, select the language code ("en-US") and the ssml
# voice gender ("neutral")
voice = {
  language_code: "en-US",
  ssml_gender:   "NEUTRAL"
}

# Select the type of audio file you want returned
audio_config = { audio_encoding: "MP3" }

# Perform the text-to-speech request on the text input with the selected
# voice parameters and audio file type
response = client.synthesize_speech synthesis_input, voice, audio_config

# The response's audio_content is binary.
File.open("output.mp3", "wb") do |file|
  # Write the response to the output file.
  file.write(response.audio_content)
end
