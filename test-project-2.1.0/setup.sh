cp -R ../test-project-2.0.2/* .
perl -pi -e 's/2.0.2/2.1.0/g' Gemfile
bundle install