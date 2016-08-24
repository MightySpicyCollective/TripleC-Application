class AddAudioToProjects < ActiveRecord::Migration
  def change
    add_attachment :projects, :audio
    add_attachment :projects, :video
  end
end
