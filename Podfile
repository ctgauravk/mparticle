# Uncomment the next line to define a global platform for your project
 platform :ios, '13.0'

def engage
  # For Engage Versions < 4.0.0, use `Engage` instead of `EngageKit`
  pod 'EngageKit', '=4.1.0'
end
target 'ct_push' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ct_push
  pod 'Leanplum-iOS-SDK'#, '6.1.1'

#  pod 'CleverTap-iOS-SDK'#,'~> 4.2.2'
#  pod 'mParticle-CleverTap', '~> 8.0'

  
  target 'ct_pushTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'ct_pushUITests' do
    # Pods for testing
  end

end
target 'rich' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ct_integration
#pod 'mParticle-CleverTap', '~> 8.0'
  pod 'CTNotificationService'
#  pod 'Leanplum-iOS-SDK'#, '6.1.1'
  
  #pod 'CleverTap-iOS-SDK'#, '~> 3.9.4'


#  pod 'EngageKit', '4.1.0'
end

target 'rich_content' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ct_integration
  pod 'CleverTap-iOS-SDK'#, '~> 3.9.4'
#pod 'mParticle-CleverTap', '~> 8.0'

  pod 'CTNotificationContent'

end
