Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( registrations/form.js )
Rails.application.config.assets.precompile += %w( sign_up.css
                                                  index.css
                                                  classroom.css
                                                  projects.css
                                                  project.css
                                                  searches/index.css
                                                  compare.css
                                                  best_in_place.js
                                                  projects/show.js
                                                  projects/form.js
                                                  comments/form.js
                                                  search.js)
