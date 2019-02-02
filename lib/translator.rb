require 'yaml'

def load_library(file_path)
  #load yaml
  lib_file = YAML.load_file(file_path)

  #result = {"angel"=>["O:)", "☜(⌒▽⌒)☞"], "angry"=>[">:(", "ヽ(ｏ`皿′ｏ)ﾉ"], "bored"=>[":O", "(ΘεΘ;)"], "confused"=>["%)", "(゜.゜)"], "embarrased"=>[":$",
  # "(#^.^#)"], "fish"=>["><>", ">゜))))彡"], "glasses"=>["8D", "(^0_0^)"], "grinning"=>["=D", "(￣ー￣)"], "happy"=>[":)", "(＾ｖ＾)"], 
  #"kiss"=>[":*", "(*^3^)/~☆"], "sad"=>[":'(", "(Ｔ▽Ｔ)"], "surprised"=>[":o", "o_O"], "wink"=>[";)", "(^_-)"]}

  #new hash for reorg
  trans_lib_file = {"get_meaning" => {}, "get_emoticon" => {}}

  #populate get meaning to be {"jpnemot or second element or array" => "meaning" or key}
  lib_file.each do |meaning, emots|
    trans_lib_file["get_meaning"][emots[1]] = meaning
  end
  lib_file.each do |meaning, emots|
    trans_lib_file["get_emoticon"][emots[0]] = emots[1]
  end

  

  return trans_lib_file


end

def get_japanese_emoticon(file_path, e_emoticon)
  trans_lib_file = load_library(file_path)

  #ensure emoticon is known
  if trans_lib_file["get_emoticon"].key?(e_emoticon) == true
    j_emoticon = trans_lib_file["get_emoticon"][e_emoticon]
    return j_emoticon
  else 
    return "Sorry, that emoticon was not found"
  end


end

def get_english_meaning(file_path, j_emoticon)
  trans_lib_file = load_library(file_path)

  #ensure emoticon is known
  if trans_lib_file["get_meaning"].key?(j_emoticon) == true
  e_meaning = trans_lib_file["get_meaning"][j_emoticon]
  return e_meaning
  else 
    return "Sorry, that emoticon was not found"
  end
end