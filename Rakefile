namespace :intergration do
	desc 'Execute basic intergration tests suite.'

	task :basic, :browser do |t, args|
		ENV['BROWSER_TYPE'] = args[:browser]
		files = Dir['spec/features/*.rb']
		exec "bundle exec rspec #{files.join(' ')}"
	end	
end