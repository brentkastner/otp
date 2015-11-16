alphabet = %w{A B C D E F G H I J K L M N O P Q R S T U V W X Y Z}

pad_file = ARGV[0]
encrypted_message = ARGV[1]
message = ""

pad = File.read(pad_file)
pad_array = pad.chars.to_a

message_array = encrypted_message.chars.to_a

message_array.each_with_index do |letter, index|
  index_of_letter = alphabet.index(letter)
  pad_letter = pad_array[index]
  index_of_pad_letter = alphabet.index(pad_letter)

  unencrypted_letter_index = index_of_letter - index_of_pad_letter

  if unencrypted_letter_index < 0
    unencrypted_letter_index = unencrypted_letter_index + 26
  end

  message << alphabet[unencrypted_letter_index]
end

#message = message.tr("XXX", " ").tr("XXXX", ".")

puts message
