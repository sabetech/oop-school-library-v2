require './nameable'
class BaseDecorator < Nameable
  def initialize(my_nameable = Nameable.new)
    super()
    @my_nameable = my_nameable
  end

  def correct_name
    @my_nameable.correct_name
  end
end
