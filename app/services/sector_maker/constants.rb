# frozen_string_literal: true

# rubocop:disable Metrics/ModuleLength
module SectorMaker
# Default constants used by SectorMaker
  module Constants
    # Traveller 5 "Expanded Hexadecimal":
    # values 1-33 mapped to 0-9, A-Z, excluding I and O.
    EHEX = [*(0..9)].zip([*("0".."9")]).to_h
                    .merge([*(10..33)].zip([*("A".."Z")] - %w[I O]).to_h)
    ENDPOINTS = { poster: "https://travellermap.com/api/poster",
                  jump: "https://travellermap.com/api/jumpmap?x=x&y=y&jump=jump" }.freeze

    DEFAULT_HEADER = { "Content-Type" => "text/plain" }.freeze
    DEFAULT_PARAMS = { scale: "128",
                      options: "25591",
                      style: "poster",
                      datauri: "1" }.freeze

    # PLACEHOLDER NAMELIST FOR NAMEGENERATOR
    DEFAULT_NAMES = ["Alabama", "Alaska", "American Samoa", "Arizona", "Arkansas",
                    "California", "Colorado", "Connecticut", "Delaware",
                    "District of Columbia", "Florida", "Georgia", "Guam", "Hawaii",
                    "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky",
                    "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan",
                    "Minnesota", "Minor Outlying Islands", "Mississippi", "Missouri",
                    "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey",
                    "New Mexico", "New York", "North Carolina", "North Dakota",
                    "Northern Mariana Islands", "Ohio", "Oklahoma", "Oregon",
                    "Pennsylvania", "Puerto Rico", "Rhode Island", "South Carolina",
                    "South Dakota", "Tennessee", "Texas", "Virgin Islands", "Utah",
                    "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin",
                    "Wyoming"].freeze

    # SECTOR GENERATION VALUES

    SUBSECTOR_LIST = %i[A B C D
                        E F G H
                        I J K L
                        M N O P].freeze

    DEFAULT_SYSTEM_PRESENCE = { A: 5, B: 5, C: 5, D: 5,
                                E: 5, F: 5, G: 5, H: 5,
                                I: 5, J: 5, K: 5, L: 5,
                                M: 5, N: 5, O: 5, P: 5 }.freeze

    # SYSTEM GENERATION VALUES

    STARPORT_DISTRIBUTION = %w[A A A B B C C D E E X].freeze

    STARPORT_TECH_MOD = { "X" => -4,
                          "C" => 2,
                          "B" => 4,
                          "A" => 6 }.freeze

    NAVAL_BASE_CHANCE_BY_PORT_CLASS = { "A" => 8,
                                        "B" => 8 }.freeze

    SCOUT_BASE_CHANCE_BY_PORT_CLASS = { "D" => 7,
                                        "C" => 8,
                                        "B" => 9,
                                        "A" => 10 }.freeze

    SIZE_TECH_MOD = { 0 => 2,
                      1 => 2,
                      2 => 1,
                      3 => 1,
                      4 => 1 }.freeze

    SIZE_DESCRIPTION = { 0 => "Asteroid or planetoid belt",
                        32 => "Stellar-scale construct" }.freeze

    ATMOSPHERE_TECH_MOD =  { 0 => 1,
                            1 => 1,
                            2 => 1,
                            3 => 1,
                            10 => 1,
                            11 => 1,
                            12 => 1,
                            13 => 1,
                            14 => 1,
                            15 => 1 }.freeze

    ATMOSPHERE_DESCRIPTION = ["No atmosphere",
                              "Trace",
                              "Very thin, tainted",
                              "Very thin",
                              "Thin, tainted",
                              "Standard",
                              "Standard, tainted",
                              "Dense",
                              "Dense, tainted",
                              "Exotic",
                              "Corrosive",
                              "Insidious",
                              "Dense, high",
                              "Ellipsoid",
                              "Thin, low"].freeze

    HYDROGRAPHICS_TECH_MOD = { 9 => 1,
                              10 => 2 }.freeze

    HYDROGRAPHICS_DESCRIPTION = { 0 => "No free standing water",
                                  10 => "No land masses" }.freeze

    POPULATION_TECH_MOD = { 1 => 1,
                            2 => 1,
                            3 => 1,
                            4 => 1,
                            5 => 1,
                            9 => 2,
                            10 => 4,
                            11 => 4,
                            12 => 4,
                            13 => 4,
                            14 => 4,
                            15 => 4 }.freeze

    POPULATION_MODIFIER_DISTRIBUTION = [1, 7, 5, 3, 1, 2, 1, 4, 6, 8, 9].freeze

    GOVERNMENT_TECH_MOD = { 0 => 1,
                            5 => 1,
                            13 => -2 }.freeze

    GOVERNMENT_DESCRIPTION_SHORT = ["No govenrment/structure",
                                    "Company/Corporation",
                                    "Participating Democracy",
                                    "Self-perpetuating Oligarchy",
                                    "Representative Democracy",
                                    "Feudal Technocracy",
                                    "Captive Government",
                                    "Balkanization",
                                    "Civil Service Bureaucracy",
                                    "Impersonal Bureaucracy",
                                    "Charismatic Dictator",
                                    "Non-charismatic Leader",
                                    "Charismatic Oligarchy",
                                    "Religious Dictatorship",
                                    "Religious Autocracy",
                                    "Totalitarian Oligarchy"].freeze
  end
end
# rubocop:enable Metrics/ModuleLength
