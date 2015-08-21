#
# Be sure to run `pod lib lint SimpleDateFormatting.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "SimpleDateFormatting"
  s.version          = "0.1.5"
  s.summary          = "A simple set of classes and methods to easily format dates and times."
  s.description      = <<-DESC

                            Simple Date Formatting alows for quick and efficent formatting of NSDate objects into NSString objects. 

                       DESC
  s.homepage         = "https://github.com/rjstelling/SimpleDateFormatting"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Richard Stelling" => "richard@empiricalmagic.com" }
  s.source           = { :git => "https://github.com/rjstelling/SimpleDateFormatting.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/rjstelling'

  s.platform     = :ios, '8.1'
  s.requires_arc = true

#spec.pod_target_xcconfig = { 'OTHER_LDFLAGS' => '-lObjC' }

  s.source_files = 'Pod/Classes/**/*'
#  s.resource_bundles = {
#   'SimpleDateFormatting' => ['Pod/Assets/*']
# }
    s.resource = ['Pod/Assets/*']

end
