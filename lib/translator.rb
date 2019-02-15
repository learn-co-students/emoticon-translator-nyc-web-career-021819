# require modules here
require "yaml"
require "pry"

def load_library(file)
  hash = {}
  emoticons = YAML.load_file("./lib/emoticons.yml")

  hash = {"get_emoticon" =>{},"get_meaning" =>{}}
    emoticons.each do |key, value|
    english = value[0]
    japanese = value[1]

    hash["get_meaning"][japanese] = value[1]
    hash["get_meaning"][japanese] = key
    hash["get_emoticon"][english] = value[0]
    hash["get_emoticon"][english] = japanese
  end
  hash
end

def get_japanese_emoticon(file, emoticon)

  load = load_library(file)
  get_emoticon = load["get_emoticon"][emoticon]
  if get_emoticon
    return get_emoticon
  else
  return "Sorry, that emoticon was not found"
  end
end


def get_english_meaning(file, emoticon)
  load = load_library(file)
  get_meaning = load["get_meaning"][emoticon]
  if get_meaning
    return get_meaning
  else
    return "Sorry, that emoticon was not found"
  end
end
