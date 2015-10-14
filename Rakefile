require './assets/environment.rb'
include Environment

namespace :integration do
	desc 'Execute basic intergration tests suite.'

	task :basic, :browser, :stack do |t, args|
		ENV['BROWSER_TYPE'] = args[:browser]
		ENV['REAL_PRINTER'] = 'false'
		files = Dir['spec/features/*.rb']
		setup_ii_environment(args)
		exec "bundle exec rspec #{files.join(' ')}"
	end	

	task :smoke_v, :browser, :stack do |t, args|
		ENV['BROWSER_TYPE'] = args[:browser]
		ENV['REAL_PRINTER'] = 'false'
		files = Dir['spec/features/smoke_test/smokeTest.rb']
		setup_ii_environment(args)
		exec "bundle exec rspec #{files.join(' ')} >> logs/test_#{ENV['STACK']}.log"
	end	

	task :smoke_r, :browser, :stack, :claim_code do |t, args|
		ENV['BROWSER_TYPE'] = args[:browser]
		ENV['CLAIM_CODE'] = args[:claim_code]
		ENV['REAL_PRINTER'] = 'true'
		files = Dir['spec/features/smoke_test/smokeTest.rb']
		setup_ii_environment(args)
		exec "bundle exec rspec #{files.join(' ')} >> logs/test_#{ENV['STACK']}.log"
	end	
end