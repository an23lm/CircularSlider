#
# Be sure to run `pod lib lint CircularSlider.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CircularSliderProgress'
  s.version          = '0.1.24'
  s.summary          = 'A simply circular slider written in Swift.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  # s.description      = <<-DESC

  s.homepage         = 'https://github.com/an23lm/CircularSlider'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'anselmjosephs@gmail.com' => 'anselmjosephs@gmail.com' }
  s.source           = { :git => 'https://github.com/an23lm/CircularSlider.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/an23lm'

  s.ios.deployment_target = '8.0'
  s.source_files = 'CircularSlider/Classes/**/*'
  
  # s.resource_bundles = {
  #   'CircularSlider' => ['CircularSlider/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
