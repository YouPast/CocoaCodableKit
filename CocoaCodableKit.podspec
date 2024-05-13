
Pod::Spec.new do |spec|

  spec.name         = "CocoaCodableKit"
  spec.version      = "0.0.1"
  spec.summary      = "A short description of CodableKit."

  spec.description  = <<-DESC
  A long description of CodableKit.
                   DESC

  spec.homepage     = "https://github.com/WendellXY/CocoaCodableKit"
  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author       = { "Wendell" => "wendellwangxinyu@icloud.com" }

  spec.ios.deployment_target = "13.0"

  spec.source       = { :git => "https://github.com/WendellXY/CocoaCodableKit.git", :tag => "#{spec.version}" }

  spec.source_files  = "Define/**/*"

  spec.preserve_paths = "Binary/*"

  macro_path = '${PODS_ROOT}/CocoaCodableKit/Binary/CodableKitMacro#CodableKitMacro'

  xcconfig = {
    'OTHER_SWIFT_FLAGS' => ['-Xfrontend', '-load-plugin-executable', '-Xfrontend', '#{macro_path}']
  }

  spec.user_target_xcconfig = xcconfig
  spec.pod_target_xcconfig = xcconfig

end
