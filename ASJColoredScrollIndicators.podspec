Pod::Spec.new do |s|
  s.name         = 'ASJColoredScrollIndicators'
  s.version      = '0.1'
  s.platform	   = :ios, '7.0'
  s.license      = { :type => 'MIT' }
  s.homepage     = 'https://github.com/sudeepjaiswal/ASJColoredScrollIndicators'
  s.authors      = { 'Sudeep Jaiswal' => 'sudeepjaiswal87@gmail.com' }
  s.summary      = 'Subclasses for UITableView and UIScrollView to apply any color to the scroll indicators'
  s.source       = { :git => 'https://github.com/sudeepjaiswal/ASJColoredScrollIndicators.git', :tag => '0.1' }
  s.source_files = 'ASJColoredScrollIndicators/*.{h,m}'
  s.requires_arc = true
end