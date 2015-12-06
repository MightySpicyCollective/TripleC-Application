module VersionsHelper
  def describe_changeset(changeset)
    str = []
    changeset.each do |f,(old,new_value)|
      if old.kind_of?(Hash)
        d = diff(old,new_value)
        d.each_key do |k|
          str << [k,old[k],new_value[k]]
        end
      else
        str << [f,old,new_value]
      end
    end
    str
  end

  def diff(hash1,other)
    hash1.dup.delete_if do |k, v|
      other[k] == v
    end.merge!(
      other.dup.delete_if do |k, v|
        hash1.has_key?(k)
      end
    )
  end

  def render_value(field, field_value)
    case field[0]
    when 'status'
      content_tag :span do
        Project::STATUSES.key(field_value).to_s.titleize
      end
    when 'source_code'
      content_tag :pre do
        field_value
      end
    else
      content_tag :span do
        field_value
      end
    end
  end

  def change_performer(version)
    performer_user(version).try(:username)
  end

  def performer_user(version)
    User.find_by(id: version.whodunnit)
  end
end
