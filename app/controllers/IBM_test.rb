require 'rest-client'
require 'uri'

user = "6be0b124-83ba-4424-b77c-299a6bf12b30"
pass = "OVNSnRsKGavd"
url = "https://#{user}:#{pass}@stream.watsonplatform.net/text-to-speech/api/v1/synthesize"
text = URI.escape("これ新しいバージョンです。")
accept = "audio/wav"
voice = "ja-JP_EmiVoice"
ofile = "output.wav"

res = RestClient.get url, {accept: accept, params:{voice:voice, text:text}}

IO.write(ofile, res.body)