# require modules here
require 'yaml'
require 'pry'

#emoticons = YAML.load_file('lib/emoticons.yml')


def load_library(path)
  # code goes here
  emoticons = YAML.load_file(path)
  newhash = {"get_meaning" => {},
            "get_emoticon" => {}}
  emoticons.each do |key, array|
    #angel, [us emoji, japanese emoji]
    newhash["get_meaning"][array[1]] = key
    newhash["get_emoticon"][array[0]] = array[1]
  end
  newhash
end

def get_japanese_emoticon(path,emoticon)
  # code goes here
  emohash = load_library(path)
  if emohash["get_emoticon"].has_key?(emoticon)
    emohash["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path,emoticon)
  emohash = load_library(path)
  if emohash["get_meaning"].has_key?(emoticon)
    emohash["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
  # code goes here
end
