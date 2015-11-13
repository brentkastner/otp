alphabet = %w{A B C D E F G H I J K L M N O P Q R S T U V W X Y Z .}

pad = File.read("pads/2015-11-13-1.txt")
message = File.read("messages/message1.txt")
encoded_text = ""

message_text_array = message.chars.to_a
secure_random_text = pad.chars.to_a


message_text_array.each_with_index do |letter, index|
  letter = letter.upcase

  index_of_message_character = alphabet.index(letter)
  letter_from_pad = secure_random_text[index]
  index_from_pad = alphabet.index(letter_from_pad)

  cypher_letter_index = index_of_message_character + index_from_pad

  if cypher_letter_index > 25
    cypher_letter_index = cypher_letter_index - 27
  end

  cypher_letter = alphabet[cypher_letter_index]

  encoded_text << cypher_letter
end

puts encoded_text
