require './dna_storage'

RSpec.describe DNAStorage do
  describe "can encode into DNA format" do
    it "encodes 'a' in DNA" do
      input = "a"
      expected_result = "GTAGTAGTAGTAGTAGTAGTATAAA"
      actual_result = DNAStorage.convert_to_dna(input)
      expect(actual_result).to eq(expected_result)
    end

    it "encodes 'cat' into DNA format" do
      input = "cat"
      expected_result = "GTAGTAGTAGTAGTAGTAGTAGACGTAGTAGTAGTAGTAGTAGTATAAACGTAGTAGTAGTAGTAGTAGTAGTAGTA"
      actual_result = DNAStorage.convert_to_dna(input)
      expect(actual_result).to eq(expected_result)
    end

    it "can encode \\x00' into DNA format" do
      input = 0.chr
      expected_result = "A"
      actual_result = DNAStorage.convert_to_dna(input)
      expect(actual_result).to eq(expected_result)
    end

    it "can encode \\xFF into DNA format" do
      input = 255.chr
      expected_result = "GTAGTAGTAGTAGTAGTAGTAGTAGTAGTAGTAGTAGTAGTAGTAGTAGTAGTAGTAGA"
      actual_result = DNAStorage.convert_to_dna(input)
      expect(actual_result).to eq(expected_result)
    end
  end

  describe "can decode from DNA format" do
    it "decodes the 'a' DNA string" do
      input = "GTAGTAGTAGTAGTAGTAGTATAAA"
      expected_result = "a"
      actual_result = DNAStorage.convert_to_ascii(input)
      expect(actual_result).to eq(expected_result)
    end

    it "decodes the 'cat' DNA string" do
      input = "GTAGTAGTAGTAGTAGTAGTAGACGTAGTAGTAGTAGTAGTAGTATAAACGTAGTAGTAGTAGTAGTAGTAGTAGTA"
      expected_result = "cat"
      actual_result = DNAStorage.convert_to_ascii(input)
      expect(actual_result).to eq(expected_result)
    end

    it "decodes the '\\x00' DNA string" do
      input = "A"
      expected_result = 0.chr
      actual_result = DNAStorage.convert_to_ascii(input)
      expect(actual_result).to eq(expected_result)
    end

    it "decodes the '\\xFF' DNA string" do
      input = "GTAGTAGTAGTAGTAGTAGTAGTAGTAGTAGTAGTAGTAGTAGTAGTAGTAGTAGTAGA"
      expected_result = 255.chr
      actual_result = DNAStorage.convert_to_ascii(input)
      expect(actual_result).to eq(expected_result)
    end
  end

  describe "can encode RNA" do
    it "encodes 'cat' into RNA format" do
      input = "cat"
      expected_result = "GUAGUAGUAGUAGUAGUAGUAGACGUAGUAGUAGUAGUAGUAGUAUAAACGUAGUAGUAGUAGUAGUAGUAGUAGUA"
      actual_result = DNAStorage.convert_to_rna(input)
      expect(actual_result).to eq(expected_result)
    end
  end

  describe "can search for substrings within a DNA-formatted string" do
    it "can find 'at' in 'cat'" do
      input = "GTAGTAGTAGTAGTAGTAGTAGACGTAGTAGTAGTAGTAGTAGTATAAACGTAGTAGTAGTAGTAGTAGTAGTAGTA"
      substring = "at"
      expected_result = 24
      actual_result = DNAStorage.find_substring_index(input, substring)
      expect(actual_result).to eq(expected_result)
    end

    it "can find 'will be' in 'cats will be cats'" do
      input = "GTAGTAGTAGTAGTAGTAGTAGACGTAGTAGTAGTAGTAGTAGTATAAACGTAGTAGTAGTAGTAGTAGTAGTAGTACGTAGTAGTAGTAGTAGTAGTAGTAGTCGTAGTATAAACGTAGTAGTAGTAGTAGTAGTAGTAGTAAAACGTAGTAGTAGTAGTAGTAGTAGTAAACGTAGTAGTAGTAGTAGTAGTAGTATACGTAGTAGTAGTAGTAGTAGTAGTATACGTAGTATAAACGTAGTAGTAGTAGTAGTAGTAGCGTAGTAGTAGTAGTAGTAGTAGAAACGTAGTATAAACGTAGTAGTAGTAGTAGTAGTAGACGTAGTAGTAGTAGTAGTAGTATAAACGTAGTAGTAGTAGTAGTAGTAGTAGTACGTAGTAGTAGTAGTAGTAGTAGTAGT"
      substring = "will be"
      expected_result = 116
      actual_result = DNAStorage.find_substring_index(input, substring)
      expect(actual_result).to eq(expected_result)
    end

    it "returns -1 when searching for 'dog' in 'cat'" do
      input = "GTAGTAGTAGTAGTAGTAGTAGACGTAGTAGTAGTAGTAGTAGTATAAACGTAGTAGTAGTAGTAGTAGTAGTAGTA"
      substring = "dog"
      expected_result = -1
      actual_result = DNAStorage.find_substring_index(input, substring)
      expect(actual_result).to eq(expected_result)
    end
  end

  describe "can find DNA complements of DNA-formatted string" do
    it "converts a DNA string into its complement" do
      input = "GTAGTAGTAGTAGTAGTAGTAGACGTAGTAGTAGTAGTAGTAGTATAAACGTAGTAGTAGTAGTAGTAGTAGTAGTA"
      expected_result = "CATCATCATCATCATCATCATCTGCATCATCATCATCATCATCATATTTGCATCATCATCATCATCATCATCATCAT"
      actual_result = DNAStorage.find_complement_dna_string(input)
      expect(actual_result).to eq(expected_result)
    end
  end

  describe "can find ASCII complements of DNA-formatted string" do
    it "converts a DNA string into its complement ASCII string 'cat'" do
      input = "CATCATCATCATCATCATCATCTGCATCATCATCATCATCATCATATTTGCATCATCATCATCATCATCATCATCAT"
      expected_result = "cat"
      actual_result = DNAStorage.find_complement_ascii_string(input)
      expect(actual_result).to eq(expected_result)
    end
  end

  describe "find longest subsequence between two DNA-formatted strings" do
    it "finds the largest subseqence between CAT and A" do
      dna_string_1 = "CAT"
      dna_string_2 = "A"
      expected_result = "A"
      actual_result = DNAStorage.find_longest_subsequence(dna_string_1, dna_string_2)
      expect(actual_result).to eq(expected_result)
    end

    it "finds no subsequence between CA and GT" do
      dna_string_1 = "CA"
      dna_string_2 = "GT"
      expected_result = ""
      actual_result = DNAStorage.find_longest_subsequence(dna_string_1, dna_string_2)
      expect(actual_result).to eq(expected_result)
    end
  end

end

