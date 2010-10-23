require 'jeweler'

Jeweler::Tasks.new do |s|
	s.name = "json2env"
	s.description = "convert json to an envdir"
	s.summary = s.description
	s.author = "Orion Henry"
	s.email = "orion@heroku.com"
	s.homepage = "http://github.com/orionz/json2env"
	s.files = FileList["[A-Z]*", "{bin,default,lib,spec}/**/*"]
	s.executables = %w(json2env)
	s.add_dependency "json"
end

Jeweler::RubyforgeTasks.new

desc 'Run specs'
task :spec do
	sh 'bacon -s spec/*_spec.rb'
end

task :default => :spec

