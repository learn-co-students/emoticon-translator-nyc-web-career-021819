# require modules here
require "yaml"
require "pry"

def load_library(file)
  # code goes here
  hash = {"get_meaning" => {}, "get_emoticon" => {}}
  yaml = YAML.load_file(file)
  yaml.each do |key, values|
    hash["get_meaning"][values[1]] = key
    hash["get_emoticon"][values[0]] = values[1]
  end
  hash
end

def get_japanese_emoticon(file, emoticon)
  # code goes here
  hash = load_library(file)
      if hash["get_emoticon"].include?(emoticon)
        hash["get_emoticon"][emoticon]
      else
        "Sorry, that emoticon was not found"
      end
end

def get_english_meaning(file, emoticon)
  # code goes here
  hash = load_library(file)
  if hash["get_meaning"].include?(emoticon)
    hash["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end 
end
