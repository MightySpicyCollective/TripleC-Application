Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( registrations/form.js )
Rails.application.config.assets.precompile += %w( sign_up.css
                                                  index.css
                                                  classroom.css
                                                  projects.css
                                                  project.css
                                                  search.css
                                                  compare.css)
