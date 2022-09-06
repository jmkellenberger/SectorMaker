# frozen_string_literal: true

module SectorMaker
  # Dice rolling methods
  module Rollable
    def adjust_to_range(number, min_value: 0, max_value: 10)
      number.clamp(min_value, max_value)
    end

    def roll(dice_quantity = 1)
      Array.new(dice_quantity) { rand(1..6) }.sum
    end

    # rubocop:disable Lint/BinaryOperatorWithIdenticalOperands
    def flux
      roll - roll
    end
    # rubocop:enable Lint/BinaryOperatorWithIdenticalOperands

    def roll_over?(target = 8, dice: 2)
      roll(dice) >= target
    end

    def roll_under?(target = 8, dice: 2)
      roll(dice) <= target
    end
  end
end
