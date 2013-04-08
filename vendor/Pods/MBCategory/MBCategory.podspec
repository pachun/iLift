Pod::Spec.new do |s|
  s.name         = "MBCategory"
  s.version      = "0.0.1"
  s.summary      = "A simple little helper library that adds methods to UIColor for getting colors from hex strings."
  s.homepage     = "https://github.com/ekdevdes/MBCategory"
  
  s.author       = { "Ethan Kramer" => "ekdevdes@gmail.com" }
  
  s.source       = { :git => "https://github.com/ekdevdes/MBCategory.git", :commit => "3771f958177756d5e04b65b03402da57b3523143" }
  s.license      = { :type => 'MIT', :file => 'FILE_LICENSE' }
  
  s.platform     = :ios
  s.source_files = '*.{h,m}'
  
  s.requires_arc = false
end
