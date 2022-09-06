# frozen_string_literal: true

module SectorMaker
  # A Traveller5 sector
  class Sector
    include Rollable
    include Constants
    include Namable
    attr_reader :sector_name
    
    def initialize(system_chance = DEFAULT_SYSTEM_PRESENCE)
      @sector_name = "New Sector"
      @system_chances = system_chance
      @hexes = {}
      generate_sector
    end

    def to_s
      "#{@hexes.values.compact.map(&:to_s).join("\n")}"
    end

    def to_txt(filename = @sector_name)
      File.write("#{filename}.txt", to_s)
    end

    def export_as(file_type = :svg)
      conn = Faraday.new(url: ENDPOINTS[:poster], params: DEFAULT_PARAMS,
                         headers: DEFAULT_HEADER)

      conn.post(ENDPOINTS[:poster]) do |req|
        #req.params[:accept] = file_type == :pdf ? "application/pdf" : "image/svg+xml"
        req.body = to_s
      end
    end

    def generate_sector
      1.upto(32) do |col|
        1.upto(40) do |row|
          hex = [col, row]
          world = check_system_presence(hex)
          @hexes[hex] = world
        end
      end
    end

    def format_hex(coordinate)
      coordinate.map { |pair| pair.to_s.rjust(2, "0") }.join
    end

    def check_system_presence(hex, letter = :A)
      return unless roll(1) >= @system_chances[letter]

      System.new(sector_name: @sector_name,
                 mainworld_name: random_name,
                 hex: format_hex(hex))
    end
  end
end
