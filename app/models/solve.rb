class Solve < ApplicationRecord
   VALID_SECONDS_REGEX = /\A\d*\.?\d*\z/
   validates :seconds, presence: true, format: {with: VALID_SECONDS_REGEX}
   validates :scramble, presence: true, length: {maximum: 100}
end
