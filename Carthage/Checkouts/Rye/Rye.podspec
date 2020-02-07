# coding: utf-8

Pod::Spec.new do |spec|

  spec.name         = "Rye"
  spec.version      = "1.1.9"
  spec.summary      = "Rye allows you to present non intrusive alerts to your users of both \"Toast\" and \"Snack Bar\" types. You can choose to display the default Rye alert type or go fully custom and display your own UIView."
  spec.homepage     = "https://github.com/nodes-ios/Rye"

  spec.author       = { "Nodes Agency - iOS" => "ios@nodes.dk" }
  spec.license      = { :type => 'MIT', :file => './LICENSE' }

  spec.platform     = :ios
  spec.source       = { :git => "https://github.com/nodes-ios/Rye.git", :tag => "#{spec.version}" }

  spec.ios.deployment_target = '11'
  spec.ios.vendored_frameworks = 'Rye.framework'

  spec.pod_target_xcconfig = { 'SWIFT_VERSION' => '5.1' }

  spec.subspec 'Rye' do |subspec|
    subspec.ios.source_files = 'Rye/Rye/**/*.swift'
  end
end
