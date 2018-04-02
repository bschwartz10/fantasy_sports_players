class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name_brief, :first_name, :last_name, :position, :age, :average_position_age_diff

  def first_name
    object.firstname
  end

  def last_name
    object.lastname
  end

  def name_brief
    case object.sport
      when 'football'
        football_name_brief
      when 'basketball'
        basketball_name_brief
      when 'baseball'
        baseball_name_brief
    end
  end

  def football_name_brief
    "#{object.firstname[0]}. #{object.lastname}"
  end

  def basketball_name_brief
    last_name = object.lastname.split(' ')
    if last_name.length == 1
      "#{object.firstname} #{object.lastname[0]}."
    elsif last_name.length == 2 && last_name[-1] == 'Jr.'
      "#{object.firstname} #{last_name[0][0]}."
    elsif last_name.length == 2
      "#{object.firstname} #{last_name[-1][0]}."
    end
  end

  def baseball_name_brief
    last_name = object.lastname.split(' ')
    if last_name.length == 1
      "#{object.firstname[0]}. #{object.lastname[0]}."
    elsif last_name.length == 2
      "#{object.firstname[0]}. #{last_name[-1][0]}."
    end
  end

  def average_position_age_diff
    return "N/A" if object.age == nil || object.average_age_for_position(object.position) == nil
    (object.age - object.average_age_for_position(object.position)).round(1)
  end

end
