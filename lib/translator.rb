require "yaml"

def load_library(path)
  emoticons = YAML.load_file(path)
  emojis = {}

  emojis["get_emoticon"] = {}
  emojis["get_meaning"] = {}

  emoticons.each do |word, emoticon|
  	emojis["get_emoticon"][emoticon.first] = emoticon.last
  	emojis["get_meaning"][emoticon.last] = word

  end
  emojis 
end


def get_japanese_emoticon(path, emoticon)
	emojis = load_library(path)
	output = emojis["get_emoticon"][emoticon]
	if output.nil?
		output = "Sorry, that emoticon was not found"
	end
	output
end

def get_english_meaning(path, emoticon)
  emojis = load_library(path)
  output = emojis["get_meaning"][emoticon]
  if output.nil?
  	output = "Sorry, that emoticon was not found"
  end
  output
end
