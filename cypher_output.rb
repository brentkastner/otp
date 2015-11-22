alphabet = %w{A B C D E F G H I J K L M N O P Q R S T U V W X Y Z 0 1 2 3 4 5 6 7 8 9}

pad_file = ARGV[0]
pad = File.read(pad_file)
message = File.read("messages/message1.txt")
encoded_text = ""

message = message.upcase.gsub(".", "XZZX")
message = message.gsub(" ", "XZX")

message_text_array = message.chars.to_a
secure_random_text = pad.chars.to_a


message_text_array.each_with_index do |letter, index|

  index_of_message_character = alphabet.index(letter)
  letter_from_pad = secure_random_text[index]
  index_from_pad = alphabet.index(letter_from_pad)

  cypher_letter_index = index_of_message_character.to_i + index_from_pad.to_i

  if cypher_letter_index > 35
    cypher_letter_index = cypher_letter_index - 36
  end

  cypher_letter = alphabet[cypher_letter_index]
  encoded_text << cypher_letter
end

puts encoded_text
