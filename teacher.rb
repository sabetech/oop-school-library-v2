require './person'



class Teacher < Person

  alias as_json_parent as_json



  def initialize(age, specialization, name: 'Unknown')

    super(age, name)

    @specialization = specialization

  end



  def can_use_services?

    true

  end



  def as_json(_options = {})

    json = as_json_parent

    json['specialization'] = @specialization

    json['class_name'] = self.class.name

    json

  end



  def to_json(*options)

    as_json(*options).to_json(*options)

  end

end

