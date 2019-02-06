# require modules here
require "yaml"

def load_library(path)
  emoticons = YAML.load_file(path)
  new_hash = {"get_meaning" => {}, "get_emoticon" => {}}    # return hash with two new keys, with                                                              inner hash
      emoticons.each do |key, value|
        new_hash["get_meaning"][value[1]] = key             #key inside at index 1 are = to the key
        new_hash["get_emoticon"][value[0]] = value[1]       #key at value[0] are enlish, and equal to                                                     the japanese version
    end
    return new_hash
end

def get_japanese_emoticon(path, emoticon)             #two arguements, path and emoticon
  library = load_library(path)                        #calling load_library
  library["get_emoticon"].each do |key, value|        #iterate over library["get_emoticon"]
    if key == emoticon                                #determine if key matches emoticon in arg
      return value                                    #if match, return the japanese version "value"
    end
  end
  return "Sorry, that emoticon was not found"         #if not match
end

def get_english_meaning(path, emoticon)
  library = load_library(path)                        #calling load_library
  library["get_meaning"].each do |key, value|        #iterate over library["get_meaning"]
    if key == emoticon                                #determine if key matches emoticon in arg
      return value                                    #if match, return the engish meaning
    end
  end
  return "Sorry, that emoticon was not found"         #if not match
end