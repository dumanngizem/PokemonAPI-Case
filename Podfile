# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def shared_pods
  use_frameworks!

  pod 'TinyConstraints', '~> 4.0'
  pod 'Kingfisher', :git => 'https://github.com/onevcat/Kingfisher', :branch => 'version6-xcode13'

end

workspace 'PokemonAPI-Case'

target 'PokemonAPI-Case' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for PokemonAPI-Case
  pod 'Alamofire', '~> 5.4'
  shared_pods

  # Lint
  pod 'SwiftLint', '~> 0.43'

end

target 'DataProvider' do
  
  project 'DataProvider/DataProvider.xcodeproj'
  
  # Pods for DataProvider
  
  # Network
  pod 'Alamofire', '~> 5.4'


end 

target 'Utilities' do
  
  project 'Utilities/Utilities.xcodeproj'

  # Pods for Utilities

end