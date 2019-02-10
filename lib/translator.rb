require "yaml"
require "pry"

def load_library(file_path)
  
  full_library = {}
  full_library["get_emoticon"] = {}
  full_library["get_meaning"] = {}
  original_hash = YAML.load_file(file_path)
  original_hash.each do |meaning, emojis|
  full_library["get_emoticon"][emojis[0]] = emojis[1]
  full_library["get_meaning"][emojis[1]] = meaning
  end
  full_library
end

def get_japanese_emoticon(file_path, emoticon)
  full_library = load_library(file_path)
  if full_library["get_emoticon"].keys.include?(emoticon)
    return full_library["get_emoticon"][emoticon]
  else 
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  full_library = load_library(file_path)
  if full_library["get_meaning"].keys.include?(emoticon)
    return full_library["get_meaning"][emoticon]
  else 
    return "Sorry, that emoticon was not found"
  end
end