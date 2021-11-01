# Этот код необходим только при использовании русских букв на Windows
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

# Подключаем встроенную в ruby библиотеку с модулем Digest
#
# https://ruby-doc.org/stdlib-2.4.0/libdoc/digest/rdoc/Digest.html
require "digest"

puts "Введите слово или фразу для шифрования:"
word_for_encryption = STDIN.gets.chomp

puts "Каким способом зашифровать:"
puts "1. MD5"
puts "2. SHA1"

choice_of_cipher = STDIN.gets.to_i

# Проверка правильности ввода

until choice_of_cipher.between?(1, 2)
  puts "Выберите 1 или 2"
  choice_of_cipher = STDIN.gets.to_i
end

# case choice_of_cipher
# when 1
#   puts "Вот что получилось: #{Digest::MD5.hexdigest(word_for_encryption)}"
# when 2
#   puts "Вот что получилось: #{Digest::SHA1.hexdigest(word_for_encryption)}"
# end

puts "Вот что получилось:"

case choice_of_cipher
when 1 then puts Digest::MD5.hexdigest(word_for_encryption)
when 2 then puts Digest::SHA1.hexdigest(word_for_encryption)
end
