module NameGenerators
  class SpaceshipNameGenerator
    WORDS_1 = [
      "Odin's",
      "Thor's",
      "Freya's",
      "Zeus's",
      "Earth's",
      "Sol's"
    ].freeze

    WORDS_2 = [
      "Folly",
      "Pride",
      "Joy",
      "Discovery"
    ].freeze

    WORDS_3 = [
      "Alpha",
      "Beta",
      "Gamma",
      "Delta",
      "Echo"
    ].freeze

    def generate
      [WORDS_1.sample, WORDS_2.sample, WORDS_3.sample].join(" ")
    end
  end
end
