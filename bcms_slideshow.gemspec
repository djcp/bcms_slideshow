SPEC = Gem::Specification.new do |spec| 
  spec.name = "bcms_slideshow"
  spec.rubyforge_project = spec.name
  spec.version = "1.0.0"
  spec.summary = "A Slideshow Module for BrowserCMS"
  spec.author = "Dan Collis-Puro" 
  spec.email = "dan@collispuro.com" 
  spec.homepage = "http://www.collispuro.com" 
  spec.files += Dir["app/**/*"]
  spec.files += Dir["db/migrate/*.rb"]
  spec.files -= Dir["db/migrate/*_browsercms_*.rb"]
  spec.files -= Dir["db/migrate/*_load_seed_data.rb"]
  spec.files += Dir["lib/bcms_slideshow.rb"]
  spec.files += Dir["lib/bcms_slideshow/*"]
  spec.files += Dir["rails/init.rb"]
  spec.files += Dir["public/bcms/slideshow/**/*"]
  spec.has_rdoc = true
  spec.extra_rdoc_files = ["README.textile"]
  if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    spec.add_dependency("bcms_thumbnail", [">= 1.0.5"])
  end
end
