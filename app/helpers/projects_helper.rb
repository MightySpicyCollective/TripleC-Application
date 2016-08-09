module ProjectsHelper
  def bool_value(value)
    return "Yes" if value.eql?("1")
    return "No"
  end

  def latest_activity(project)
    activity = project.versions.order(created_at: :desc).first

    if activity
      "#{change_performer(activity)} / #{activity.created_at.to_date.to_s(:long)}"
    else
      "-"
    end
  end

  def latest_comment(project)
    comment = project.comments.order(created_at: :desc).first
    if comment
      "#{truncate(comment.content, length: 50)} - #{comment.user.username}"
    else
      "-"
    end
  end
end
