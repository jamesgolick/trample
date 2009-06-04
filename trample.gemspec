# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{trample}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["James Golick"]
  s.date = %q{2009-06-04}
  s.default_executable = %q{trample}
  s.email = %q{james@giraffesoft.ca}
  s.executables = ["trample"]
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION.yml",
     "bin/trample",
     "lib/trample.rb",
     "lib/trample/cli.rb",
     "lib/trample/configuration.rb",
     "lib/trample/logging.rb",
     "lib/trample/page.rb",
     "lib/trample/runner.rb",
     "lib/trample/session.rb",
     "lib/trample/timer.rb",
     "test/cli_test.rb",
     "test/configuration_test.rb",
     "test/fixtures/basic_config.rb",
     "test/integration/trample_a_single_url_test.rb",
     "test/logging_test.rb",
     "test/page_test.rb",
     "test/runner_test.rb",
     "test/session_test.rb",
     "test/test_helper.rb",
     "test/timer_test.rb",
     "test/trample_test.rb",
     "trample.gemspec"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/giraffesoft/trample}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{TODO}
  s.test_files = [
    "test/cli_test.rb",
     "test/configuration_test.rb",
     "test/fixtures/basic_config.rb",
     "test/integration/trample_a_single_url_test.rb",
     "test/logging_test.rb",
     "test/page_test.rb",
     "test/runner_test.rb",
     "test/session_test.rb",
     "test/test_helper.rb",
     "test/timer_test.rb",
     "test/trample_test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
