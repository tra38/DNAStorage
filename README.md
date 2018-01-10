# DNA Storage

Encode ASCII strings into DNA. Created as part of a coding challenge.

## Installation
```git clone``` the repository. To run the automated tests, type ```rspec```.

## Examples of Usage

#### Converting an ASCII string to DNA
```
require_relative "path/to/dna_storage.rb"

string_to_encode = "cat"

puts DNAStorage.convert_to_dna(string_to_encode)
#=>"GTAGTAGTAGTAGTAGTAGTAGACGTAGTAGTAGTAGTAGTAGTATAAACGTAGTAGTAGTAGTAGTAGTAGTAGTA"
```

#### Converting an ASCII string to RNA
```
require_relative "path/to/dna_storage.rb"

string_to_encode = "cat"

puts DNAStorage.convert_to_rna(string_to_encode)
#=>"GUAGUAGUAGUAGUAGUAGUAGACGUAGUAGUAGUAGUAGUAGUAUAAACGUAGUAGUAGUAGUAGUAGUAGUAGUA"
```

#### Find the starting index of an ASCII substring within an encoded DNA string
```
require_relative "path/to/dna_storage.rb"

substring = "at"
string_to_decode = "GTAGTAGTAGTAGTAGTAGTAGACGTAGTAGTAGTAGTAGTAGTATAAACGTAGTAGTAGTAGTAGTAGTAGTAGTA"

puts DNAStorage.find_substring_index(string_to_encode)
#=> 24
```

#### Find complement ASCII string of a DNA string
```
require_relative "path/to/dna_storage.rb"

dna_string = "CATCATCATCATCATCATCATCTGCATCATCATCATCATCATCATATTTGCATCATCATCATCATCATCATCATCAT"
puts DNAStorage.find_complement_ascii_string(dna_string)
#=> "cat"
```

#### Find longest subsequence between two DNA strings
```
require_relative "path/to/dna_storage.rb"

dna_string_1 = "CAT"
dna_string_2 = "A"
puts DNAStorage.find_longest_subsequence(dna_string_1, dna_string_2)
#=> "A"
```
