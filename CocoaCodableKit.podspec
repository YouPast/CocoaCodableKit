
Pod::Spec.new do |spec|

  spec.name         = "CocoaCodableKit"
  spec.version      = "0.0.4"
  spec.summary      = "A CocoaPods compatible version of CodableKit."

  spec.description  = <<-DESC
  A CocoaPods compatible version of CodableKit.
                   DESC

  spec.homepage     = "https://github.com/WendellXY/CocoaCodableKit"
  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author       = { "Wendell" => "wendellwangxinyu@icloud.com" }

  spec.swift_version = "5.9"
  spec.ios.deployment_target = "13.0"

  spec.source       = { :git => "https://github.com/WendellXY/CocoaCodableKit.git", :tag => "#{spec.version}" }

  spec.source_files  = "Define/**/*"

  spec.preserve_paths = "Binary/CodableKitMacros", "CodableKit"

  spec.prepare_command = <<-CMD
  cd CodableKit
  git submodule update --init --recursive
  echo 'Script to update the submodule to the latest tag'
  git fetch --tags
  git checkout $(git describe --tags `git rev-list --tags --max-count=1`)
  sh build_binary.sh
  CMD

  xcconfig = {
    'OTHER_SWIFT_FLAGS' => [
      '-load-plugin-executable',
      '${PODS_ROOT}/CocoaCodableKit/CodableKit/.build/release/CodableKitMacros#CodableKitMacros'
    ]
  }
  spec.user_target_xcconfig = xcconfig
  spec.pod_target_xcconfig = xcconfig
end
