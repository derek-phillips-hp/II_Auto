require './assets/environment.rb'
include Environment

namespace :integration do
	desc 'Execute basic intergration tests suite.'

	task :basic, :browser, :stack do |t, args|
		ENV['BROWSER_TYPE'] = args[:browser]
		files = Dir['spec/features/*.rb']
		setup_ii_environment(args)
		exec "bundle exec rspec #{files.join(' ')}"
	end	

		task :smoke, :browser, :stack do |t, args|
		ENV['BROWSER_TYPE'] = args[:browser]
		files = Dir['spec/features/smoke_test/smokeTest.rb']
		setup_ii_environment(args)
		exec "bundle exec rspec #{files.join(' ')} >> logs/test_#{ENV['STACK']}.log"
	end	
end