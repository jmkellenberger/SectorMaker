# frozen_string_literal: true

module SectorMaker
  # A Traveller5 star system
  class System
    include Rollable
    include Constants
    
    attr_reader :names, :hex, :uwp, :bases, :trade_codes, :travel_code, :pbg,
                :allegiance

    def initialize(sector_name: "----", hex: "0101", mainworld_name: hex,
                   uwp: World.new(:main), pbg: random_pbg)
      @names = { sector: sector_name,
                 main_world: mainworld_name }
      @hex = hex
      @uwp = uwp
      @pbg = pbg
      @trade_codes = "Ag Ni"
      @bases = "N"
      @allegiance = "Nebay"
      @travel_code = [" ", "A", "R"].sample
    end

    def to_s
      "#{names[:main_world].ljust(17)} #{hex} #{uwp}  #{bases} " \
        "#{trade_codes.ljust(19)} #{travel_code}  #{pbg} #{allegiance[0..1]}"
    end

    def random_pbg
      [random_population_modifier,
       random_number_of_planetoid_belts,
       random_number_of_gas_giants].map(&:to_s).join
    end

    def random_population_modifier
      POPULATION_MODIFIER_DISTRIBUTION[roll(2) - 2]
    end

    def random_number_of_planetoid_belts
      [roll - 3, 0].max
    end

    def random_number_of_gas_giants
      [(roll(2) / 2) - 2, 0].max
    end
  end
end
