require 'cocoapods-triumph-sdk-plugin/command'

module CocoapodsTriumphSdkPlugin
    Pod::HooksManager.register('cocoapods-triumph-sdk-plugin', :post_install) do |installer, options|
        installer.pods_project.targets.each do |target|
            target.build_configurations.each do |config|

                xcconfig_path = config.base_configuration_reference.real_path
                xcconfig = File.read(xcconfig_path)
              
                new_xcconfig = xcconfig.sub('-framework "RecaptchaEnterprise"', '')
                new_xcconfig = new_xcconfig.sub('-framework "FirebaseAnalytics"', '')
                new_xcconfig = new_xcconfig.sub('-framework "GoogleAppMeasurement"', '')
                new_xcconfig = new_xcconfig.sub('-framework "GoogleAppMeasurementIdentitySupport"', '')
              
                File.open(xcconfig_path, "w") { |file| file << new_xcconfig }

                if config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'].to_f < 14.0
                    config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
                end

                config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
              
                if target.respond_to?(:product_type) and target.product_type == "com.apple.product-type.bundle"
                    config.build_settings['CODE_SIGNING_ALLOWED'] = 'NO'
                end
            end
        end
    end
end