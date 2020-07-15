require 'bundler/cli'
# Bundler::GemHelper.install_task

task :rubocop do 
	Bundler::unbundled_system(`bundle exec rubocop app`)
end

task :sandi_meter do
	Bundler.unbundled_system(`bundle exec sandi_meter -d -g -p app -o tmp/sandi_meter`)
end

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new('spec')

require 'rubycritic_small_badge'
require 'rubycritic/rake_task'
RubyCriticSmallBadge.configure do |config|
  config.minimum_score = ENV.fetch('RUBYCRITICLIMIT', 95.0)
end
RubyCritic::RakeTask.new do |task|
  task.options = %(--custom-format RubyCriticSmallBadge::Report
--minimum-score #{RubyCriticSmallBadge.config.minimum_score}
--format html --format console)
  task.paths = FileList['app/**/*.rb']
end

task default: %i[rubycritic sandi_meter]