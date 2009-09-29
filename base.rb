# clear the readme
run "echo TODO > README"

# install often used gems
gem 'mislav-will_paginate', :lib => 'will_paginate', :source => 'http://gems.github.com'


rake('gems:install', :sudo => true)

# initialize git repo
git :init

# set up compass & haml
run "haml --rails ."
run "echo 'using the blueprint framework w/compass...'"
run "compass --rails -f blueprint ."


# set up .gitignore
file ".gitignore", <<-END
.DS_STORE
log/*.log
tmp/**/*
config/database.yml
db/*.sqlite3
END

run "touch tmp/.gitignore log/.gitignore vendor/.gitignore"

# Copy database.yml for deploy
run "cp config/database.yml config/example_database.yml"


git :add => "."
git :commit => "-m 'initial commit'"