Pod::Spec.new do |s|
  s.name         = "SBASlantedView"
  s.version      = "1.0"
  s.summary      = "SBASlantedView is a simple and easy-to-use Slanted View for your iOS apps written in Swift."
  s.homepage     = "https://github.com/shoaib-akhtar/SlantedView"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Shoaib Akhtar" => "shoaib.akhtar1@live.com" }
  s.source       = { :git => "https://github.com/shoaib-akhtar/SlantedView.git", :branch => "master",
                     :tag => s.version.to_s }
  s.platform     = :ios, '11.0'
  s.requires_arc = true
  s.source_files = "SBASlantedView/*.swift"
  s.frameworks   = 'Foundation', 'UIKit'
  s.swift_version = '5.0'
end
