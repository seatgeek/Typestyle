Pod::Spec.new do |spec|
  spec.name          = 'Typestyle'
  spec.version       = '1.0.0'
  spec.license       = { :type => 'BSD' }
  spec.homepage      = 'https://github.com/seatgeek/Typestyle'
  spec.author        = 'SeatGeek'
  spec.summary       = 'Custom fonts made easy, on iOS'
  spec.source        = { :git => 'https://github.com/seatgeek/Typestyle.git', :tag => 'v1.0.0' }
  spec.module_name   = 'Typestyle'
  spec.swift_version = '4.2'
  spec.ios.deployment_target  = '9.0'
  spec.source_files       = 'Source/*.swift'
  spec.ios.framework  = 'UIKit'
end