# Uncomment the next line to define a global platform for your project
platform :ios, '16.0'

target 'grint-test' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for grint-test
  pod 'SDWebImage', '~> 5.0'
  pod 'Alamofire', '~> 5.0'

  target 'grint-testTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'grint-testUITests' do
    # Pods for testing
  end

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '16.0'
    end
  end
end