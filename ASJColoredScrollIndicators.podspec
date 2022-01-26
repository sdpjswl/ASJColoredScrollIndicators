Pod::Spec.new do |s|
  s.name          = 'ASJColoredScrollIndicators'
  s.version       = '1.2'
  s.platform      = :ios, '9.0'
  s.license       = { :type => 'MIT' }
  s.homepage      = 'https://github.com/sdpjswl/ASJColoredScrollIndicators'
  s.authors       = { 'Sudeep' => 'sdpjswl1@gmail.com' }
  s.summary       = 'Apply color to scroll indicators of any UIScrollView'
  s.source        = { :git => 'https://github.com/sdpjswl/ASJColoredScrollIndicators.git', :tag => s.version }
  s.source_files  = 'ASJColoredScrollIndicators/*.{h,m}'
  s.requires_arc  = true
end