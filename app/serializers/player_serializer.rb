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
        "#{object.firstname[0]}. #{object.lastname}"
      when 'basketball'
        "#{object.firstname} #{object.lastname[0]}."
      when 'baseball'
        "#{object.firstname[0]}. #{object.lastname[0]}."
    end
  end

  def average_position_age_diff
    return "N/A" if object[:age] == nil
    (object[:age] - object.average_age_for_position(object[:position])).round(1)
  end

end
