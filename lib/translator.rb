# require modules here

require 'yaml'
require 'pry'

def load_library(file_path)
  # code goes here
  
    new_hash = {"get_meaning" => {}, "get_emoticon" => {}}
  thing = YAML.load_file(file_path)
  thing.each do |english_meaning, emoticon_arr|
      new_hash["get_meaning"][emoticon_arr[1]] = english_meaning
      new_hash["get_emoticon"][emoticon_arr[0]] = emoticon_arr[1]
  end
  return new_hash
  
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  
   reference = load_library(file_path)
  array = []

   reference.each {|name, emojis| emojis.each {|key, value| #puts 
    if key == emoticon
        array << value 
    end }}

   if array.empty?
    "Sorry, that emoticon was not found"
  else 
    array[0]  
  end
  
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  
  reference = load_library(file_path)
  array = []

   reference.each {|name, emojis| emojis.each {|key, value| 
    if key == emoticon
        array << value 
    end }}

   if array.empty?
    "Sorry, that emoticon was not found"
  else 
    array[0]  
  end
  
  
end