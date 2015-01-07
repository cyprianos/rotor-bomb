#cipherText = "iq ifcc vqqr fb rdq vfllcq na rdq cfjwhwz hr bnnb hcc hwwhbsqvqbre hwq vhlq"

cipher_text = "lrvmnir bpr sumvbwvr jx bpr lmiwv yjeryrkbi jx qmbm wi
bpr xjvni mkd ymibrut jx irhx wi bpr riirkvr jx
ymbinlmtmipw utn qmumbr dj w ipmhh but bj rhnvwdmbr bpr
yjeryrkbi jx bpr qmbm mvvjudwko bj yt wkbrusurbmbwjk
lmird jk xjubt trmui jx ibndt
wb wi kjb mk rmit bmiq bj rashmwk rmvp yjeryrkb mkd wbi
iwokwxwvmkvr mkd ijyr ynib urymwk nkrashmwkrd bj ower m
vjyshrbr rashmkmbwjk jkr cjnhd pmer bj lr fnmhwxwrd mkd
wkiswurd bj invp mk rabrkb bpmb pr vjnhd urmvp bpr ibmbr
jx rkhwopbrkrd ywkd vmsmlhr jx urvjokwgwko ijnkdhrii
ijnkd mkd ipmsrhrii ipmsr w dj kjb drry ytirhx bpr xwkmh
mnbpjuwbt lnb yt rasruwrkvr cwbp qmbm pmi hrxb kj djnlb
bpmb bpr xjhhjcwko wi bpr sujsru msshwvmbwjk mkd
wkbrusurbmbwjk w jxxru yt bprjuwri wk bpr pjsr bpmb bpr
riirkvr jx jqwkmcmk qmumbr cwhh urymwk wkbmvb"

cipher_text.gsub!(/[\n\t\s]/,"") #remove white chars. TODO if someone want cipher with white chars.


replacement = {}

freq_english = {
  a:  0.0817,
  b:  0.0150,
  c:  0.0278,
  d:  0.0425,
  e:  0.1270,
  f:  0.0223,
  g:  0.0202,
  h:  0.0609,
  i:  0.0697,
  j:  0.0015,
  k:  0.0077,
  l:  0.0403,
  m:  0.0241,
  n:  0.0675,
  o:  0.0751,
  p:  0.0193,
  q:  0.0010,
  r:  0.0599,
  s:  0.0633,
  t:  0.0906,
  u:  0.0276,
  v:  0.0098,
  w:  0.0236,
  x:  0.0015,
  y:  0.0197,
  z:  0.0007
}
freq_english = freq_english.sort_by { |k,v| v }.reverse
freq_cipher = {}

current_text = cipher_text

cipher_text.each_char do |letter, freq|
    if letter!=' ' && letter != "\n"
    if freq_cipher.include? letter 
      freq_cipher[letter] += 1
    else
      freq_cipher[letter] = 1
    end 
  end
end

freq_cipher = freq_cipher.sort_by { |k,v| v }.reverse


tmp_hash = freq_cipher.clone
freq_english.each do |key,value|
  
  item = tmp_hash.shift
  if item

    p key
    p value
    p item
    replacement[key] = item[0]
  end
end



finish = false

def print_menu
  puts "clear\t\t\t\t\t\t clear_console" # implemented
  puts "help\t\t\t\t\t\t view this command list" #implemented
  puts "english\t\t\t\t\t\t view frequencies of english letters" #implemented
  puts "freq\t\t\t\t\t\t view frequencies of cryptext"
  puts "original\t\t\t\t\t view encrypted text" 
  puts "current\t\t\t\t\t\t view modified text"
  puts "table\t\t\t\t\t\t view replacement table" #implemented
  puts "restore [letter]\t\t\t\t restore replacement"
  puts "subst [replaced] [replacement]\t\t\t replace one letter with another"
  puts "quit\t\t\t\t\t\t exit app" # implemented
  puts "\n\n"
end

print_menu
while not finish do
  print "decipher> "
  selected = gets.chomp
  
  case selected
  when "quit"
    finish = true
  when "clear"
    exec("clear;")
  when "help"
    print_menu
  when "english"
    p freq_english
  when "original"
    puts cipher_text
  when "current"
    puts current_text
  when "freq"
    p freq_cipher
  when "table"
    p replacement
  end
end
