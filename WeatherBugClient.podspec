Pod::Spec.new do |s|
  s.name          = 'WeatherBugClient'
  s.version       = '0.1'
  s.license       = 'MIT'
  s.summary       = 'An iOS wrapper for weatherbug.com web services.'
  s.homepage      = 'http://github.com/chenyuan/WeatherBugClient'
  s.author        = { 'Yuan Chen' => 'chris@ciderstudios.com' }
  s.source        = { :git => 'https://github.com/chenyuan/WeatherBugClient.git',:branch=>'master' }
  s.source_files  = 'WeatherBugClient/*.{h,m}'
  s.resources     = 'WeatherBugClient/images/*.png'
  s.framework     = 'CoreLocation'
  s.requires_arc  = true
  s.platform      = :ios
  s.dependency 'AFNetworking'
  s.dependency 'XMLDictionary'
  s.dependency 'JSONKit'
end
