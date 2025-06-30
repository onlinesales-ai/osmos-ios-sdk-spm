#
# Be sure to run `pod lib lint osmos-ios-sdk-spm.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "osmos-ios-sdk-spm"
  s.module_name      = "osmos"
  s.version          = "2.0.0"
  s.summary          = "iOS SDK for the OSMOS Ad fetching, Ad rendering and Event tracking"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description      = <<-DESC
                          iOS SDK for the OSMOS Ad fetching, Ad rendering and Event tracking. For more information see the OSMOS SDK implementation docs at https://developers.onlinesales.ai/docs/init-ios-sdk.
                       DESC

  s.homepage         = "https://www.osmos.ai/"
  s.license          = 'Apache 2.0'
  s.author           = { "osmos.ai" => "api@osmos.ai" }
  s.source           = { :git => "https://github.com/onlinesales-ai/osmos-ios-sdk-spm.git", :tag => s.version.to_s }

  s.platform     = :ios, '15.0'
  s.requires_arc = true

  s.swift_versions = ['5.5']

  s.source_files = 'Sources/**/*.swift'
end
