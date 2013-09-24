require "tg/version"

module Tg
	require "rubygems"
	require "thor"

	class Template < Thor
		include Thor::Actions

		desc "generate", "create wordless template files"
		method_option :nice_name, :aliases => '-n', :desc => "Nice name which appears in the wordpress template picker"
		def generate(name)
			nice_name = options[:nice_name]
			nice_name || nice_name = name.capitalize
			create_file "template/template-#{name}.php", <<-TMP
	<?php
	/*
	Template Name: #{nice_name} Page
	*/
	render_view('pages/#{name}'); 
	TMP
			
			create_file "theme/views/pages/#{name}.html.haml"
			create_file "theme/assets/stylesheets/pages/#{name}.sass"
			begin
				append_to_file "theme/assets/stylesheets/screen.sass", "@import \"pages/#{name}\""
			rescue
				say "\n\r 		screen.sass file was not found, no @import statement created\n\r"
			end
		end

		def self.source_root
	    File.dirname(__FILE__)
	  end
	end

	Template.start
end
