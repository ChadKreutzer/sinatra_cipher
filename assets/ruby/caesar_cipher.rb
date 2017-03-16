# Implement a caesar cipher that takes in a string and the shift factor and
# then outputs the modified string

class Caesar
  def cipher(sentence, raw_offset)
    offset = raw_offset % 26
    sentence.gsub(/([a-zA-Z])/) { |char| shift_the_letter(char.ord, offset).chr }
  end
  
  private
  
  def shift_the_letter(letter_value, shift_value)
    cipher_letter = letter_value + shift_value
    cipher_letter > z_spot(letter_value) ? cipher_letter - 26 : cipher_letter
  end
  
  def z_spot(current_char)
    current_char.between?(65, 90) ? 90 : 122
  end
end
