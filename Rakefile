require './assets/environment.rb'
include Environment

namespace :intergration do
	desc 'Execute basic intergration tests suite.'

	task :basic, :browser, :stack do |t, args|
		ENV['BROWSER_TYPE'] = args[:browser]
		files = Dir['spec/features/*.rb']
		setup_ii_environment(args)
		exec "bundle exec rspec #{files.join(' ')}"
	end	
end