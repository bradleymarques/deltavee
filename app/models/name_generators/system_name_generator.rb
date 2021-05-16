##
# Generates a random, believable name for a star System
#
module NameGenerators
  class SystemNameGenerator
    TECHNIQUES = [:letters_and_digits].freeze
    LETTERS = ("A".."Z").to_a
    NUMBERS = (0..9).to_a

    def generate
      send(TECHNIQUES.sample)
    end

    private

    def letters_and_digits
      [
        LETTERS.sample((3..5).to_a.sample).join(""),
        NUMBERS.sample((5..7).to_a.sample).join("")
      ].join("-")
    end
  end
end
