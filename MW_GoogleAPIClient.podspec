Pod::Spec.new do |s|
  s.name         = "MW_GoogleAPIClient"
  s.version      = "0.0.1"
  s.summary      = "Google APIs Client Library for Objective-C"
  s.description  = <<-DESC
      Written by Google, this library is a flexible and efficient Objective-C
      framework for accessing JSON APIs.  This is the recommended library for
      accessing JSON-based Google APIs for iOS and Mac OS X applications.
      This version can be used with iOS ≥ 7.0 or OS X ≥ 10.8.
                   DESC
  s.homepage     = "https://github.com/MaxWeaver/google-api-objectivec-client"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = 'Google Inc.'
  s.ios.deployment_target = '7.0'
  s.osx.deployment_target = '10.8'
  s.tvos.deployment_target = '9.0'
  s.source       = { :git => "https://github.com/MaxWeaver/google-api-objectivec-client.git", :tag => "v#{s.version}" }

  s.user_target_xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) GTL_USE_FRAMEWORK_IMPORTS=1' }
  s.pod_target_xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) GTL_HAS_SESSION_UPLOAD_FETCHER_IMPORT=1' }
  s.requires_arc = false
  s.dependency 'GTMSessionFetcher', '~> 1.1'

  s.subspec 'Core' do |sp|
    sp.source_files = 'Source/GTLDefines.h',
                      'Source/Objects/*.{h,m}',
                      'Source/Utilities/*.{h,m}'
  end
  s.default_subspec = 'Core'

  # subspecs for all the services.
  s.subspec 'Drive' do |sp|
    sp.dependency 'MW_GoogleAPIClient/Core'
    sp.source_files = 'Source/Services/Drive/Generated/*.{h,m}'
    sp.exclude_files = 'Source/Services/Drive/Generated/GTLDrive_Sources.m'
  end

end