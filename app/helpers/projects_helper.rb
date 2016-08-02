module ProjectsHelper
  def bool_value(value)
    return "Yes" if value.eql?("1")

    return "No"
  end
end
