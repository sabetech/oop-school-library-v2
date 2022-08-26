require './base_decorator'
require './nameable'

class CapitalizeDecorator < BaseDecorator
  def initialize(nameable = Nameable.new)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name.capitalize
  end
end
