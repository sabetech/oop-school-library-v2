require './nameable'
require './base_decorator'

class TrimmerDecorator < BaseDecorator
  def initialize(my_nameable = Nameable.new)
    super()
    @my_nameable = my_nameable
  end

  def correct_name
    @my_nameable.correct_name.slice(0, 10)
  end
end
