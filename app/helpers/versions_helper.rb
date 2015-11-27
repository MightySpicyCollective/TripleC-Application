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
end
