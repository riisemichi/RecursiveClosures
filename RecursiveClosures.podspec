Pod::Spec.new do |spec|
  spec.name = "RecursiveClosures"
  spec.version = "0.0.1"
  spec.summary = "Library to make recursive closures easy in Swift."
  spec.homepage = "https://github.com/riisemichi/RecursiveClosures"
  spec.license = { type: 'MIT', file: 'LICENSE' }
  spec.authors = { "Michael Zurmühle" => 'mzurmuehle@gmail.com' }

  spec.platform = :ios, "8.0"
  spec.requires_arc = true
  spec.source = { git: "https://github.com/riisemichi/RecursiveClosures.git", tag: "#{spec.version}", submodules: true }
  spec.source_files = "RecursiveClosures/**/*.{h,swift}"
end
