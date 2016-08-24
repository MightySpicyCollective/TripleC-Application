class RemoveCompletedSoundSnippetUrlFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :completed_sound_snippet_url, :string
  end
end
