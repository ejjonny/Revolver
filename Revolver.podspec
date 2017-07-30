Pod::Spec.new do |s|
  s.name = "Revolver"
  s.version = "1.2.2"
  s.summary = "A framework for building fast genetic algorithms."
  s.description = <<-DESC
  Revolver is a framework for building fast genetic algorithms in Swift 3.0.
  It supports tree-based and array-based chromosome structures, all common genetic operators,
  selections and terminations. It allows sequential and parallel processing.
  Everything listed is ready-to-run, yet easily extensible.
  By subclassing base classes and conforming to protocols, you can customize almost anything.
                   DESC
  s.homepage = "https://github.com/petrmanek/Revolver"
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.author = "Petr Mánek"
  s.social_media_url = "http://twitter.com/petrmanek"

  s.osx.deployment_target = "10.9"
  s.ios.deployment_target = "8.0"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"

  s.source = { :git => "https://github.com/petrmanek/Revolver.git", :tag => "v#{s.version}" }
  s.source_files = "Sources", "Sources/*.{h,m}"

  s.dependency "SwiftyJSON", "~> 3.1"
end
