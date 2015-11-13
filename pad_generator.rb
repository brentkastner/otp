require 'securerandom'
require 'date'

alphabet = %w{A B C D E F G H I J K L M N O P Q R S T U V W X Y Z}
pad = ''

#number of pads to generate
number_of_pads = ARGV[0]

if ARGV[0] == nil
  number_of_pads = 1
end

for current_pad in 1..number_of_pads.to_i do
  10000.times do
    secure_letter = SecureRandom.random_number(26)
    pad << alphabet[secure_letter]
  end

  #if we want to break the pad into sections of 5 characters
  #pad = pad.scan(/.{1,5}/).join(' ')
  #puts pad

  File.write("pads/#{Date.today.to_s}-#{current_pad}.txt", pad)
end

