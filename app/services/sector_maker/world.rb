# frozen_string_literal: true

module SectorMaker
  # Represents Traveller5 worlds
  class World
    include Rollable
    include Constants
    
    attr_reader :starport, :size, :atmosphere, :hydrographics,
                :population, :government, :law_level, :tech_level

    def initialize(_)
      @starport = random_starport
      @size = random_size
      @atmosphere = random_atmosphere
      @hydrographics = random_hydrographics
      @population = random_population
      @government = random_government
      @law_level = random_law_level
      @tech_level = random_tech_level
    end

    def to_s
      starport + attributes_to_ehex
    end

    def attributes_to_ehex
      [size,
       atmosphere,
       hydrographics,
       population,
       government,
       law_level,
       tech_level].map { |value| EHEX[value] }.join.insert(6, "-")
    end

    def random_starport
      STARPORT_DISTRIBUTION[roll(2) - 2]
    end

    def random_size
      result = roll(2) - 2

      if result == 10
        9 + roll
      else
        result
      end
    end

    def random_atmosphere
      return 0 if size < 2

      result = flux + size

      adjust_to_range(result, max_value: 15)
    end

    def atmosphere_mod
      return atmosphere unless atmosphere < 2 || atmosphere > 9

      atmosphere - 4
    end

    def random_hydrographics
      return 0 if size < 2

      adjust_to_range(flux + atmosphere_mod)
    end

    def random_population
      result = roll(2) - 2

      if result == 10
        roll(2) + 3
      else
        result
      end
    end

    def random_government
      return 0 if population.zero?

      adjust_to_range(flux + population, max_value: 15)
    end

    def random_law_level
      adjust_to_range(flux + government, max_value: 18)
    end

    def random_tech_level
      calculation = [roll,
                     STARPORT_TECH_MOD.fetch(starport, 0),
                     SIZE_TECH_MOD.fetch(size, 0),
                     ATMOSPHERE_TECH_MOD.fetch(atmosphere, 0),
                     HYDROGRAPHICS_TECH_MOD.fetch(hydrographics, 0),
                     POPULATION_TECH_MOD.fetch(population, 0),
                     GOVERNMENT_TECH_MOD.fetch(government, 0)].sum

      adjust_to_range(calculation, max_value: 33)
    end
  end
end
