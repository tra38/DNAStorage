require 'set'

module DNAStorage
  ASCII_ENCODING = {
    "G" => 8,
    "T" => 4,
    "A" => 1
  }

  COMPLEMENTS = {
    "A" => "T",
    "T" => "A",
    "G" => "C",
    "C" => "G"
  }

  def self.convert_to_ascii(dna_string)
    dna_string.split("C").map do |dna_section|
      counter = 0

      dna_section.each_char do |base|
        counter += ASCII_ENCODING[base]
      end

      ordinal_number = counter - 1

      ordinal_number.chr
    end.join("")
  end

  def self.convert_to_rna(ascii_string)
    convert_to_dna(ascii_string).gsub("T", "U")
  end

  def self.find_complement_ascii_string(dna_string)
    convert_to_ascii(find_complement_dna_string(dna_string))
  end

  def self.find_complement_dna_string(dna_string)
    dna_string.each_char.map do |character|
      COMPLEMENTS[character]
    end.join("")
  end

  def self.find_substring_index(dna_string, substring)
    ascii_string = convert_to_ascii(dna_string)

    if ascii_string.include?(substring)
      starting_index = ascii_string.index(substring)
      ending_index = starting_index + (substring.length - 1)

      dna_substring = convert_to_dna(ascii_string[starting_index..ending_index])
      dna_string.index(dna_substring)
    else
      -1
    end

  end

  def self.find_longest_subsequence(dna_string_1, dna_string_2)
    dna_set_1 = get_all_subsequences(dna_string_1)
    dna_set_2 = get_all_subsequences(dna_string_2)

    all_common_subsequences = (dna_set_1 & dna_set_2)

    longest_subsequence = all_common_subsequences.max_by(&:length)

    if longest_subsequence
      longest_subsequence
    else
      ""
    end
  end

  def self.get_all_subsequences(dna_string)
    set = Set.new

    dna_string.each_char.with_index do |character, index|
      string =  ""
      dna_string[index..-1].each_char do |character|
        string << character
        set << string
      end
    end

    set
  end


  def self.convert_to_dna(ascii_string)

    array_of_dna_snippets = ascii_string.each_char.map do |character|

      final_string = ""
      ordinal_number = character.ord

      counter = ordinal_number + 1

      while (counter > 0)
        ASCII_ENCODING.each do |key, value|
          if (counter >= value)
            counter -= value
            final_string << key
          end
        end
      end

      final_string
    end

    array_of_dna_snippets.join("C")
  end

end