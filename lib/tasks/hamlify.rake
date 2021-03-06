require 'haml/html'
namespace :hamlify do
	desc "Convert ERB to Haml"
	task :convert => :environment do 
		Dir["#{Rails.root}/app/views/**/*.erb"].each do |file_name|
			puts "Hamifying: #{file_name}"
			haml_file_name = file_name.gsub(/erb$/,"haml")
			if !File.exist?(haml_file_name)
				erb_string = File.open(file_name).read
				haml_string = Haml::HTML.new(erb_string,:erb => true).render
				f = File.new(haml_file_name, "w")
				f.write(haml_string)
				File.delete(file_name)
			end
		end

	end
end

# gem "haml-rails"

# development:
# gem "hpricot"
# gem "ruby_parser"

# bundle

# cd /app/views/layouts
# hmtl2haml application.html.erb > application.html.haml
# rake hamlify:convert


