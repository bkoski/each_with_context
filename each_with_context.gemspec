# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{each_with_context}
  s.version = "0.5.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ben Koski"]
  s.date = %q{2009-05-28}
  s.description = %q{TODO}
  s.email = %q{gems@benkoski.com}
  s.files = ["lib/each_with_context", "lib/each_with_context.rb", "lib/each_with_context/enumerable.rb", "lib/each_with_context/enumerable_context.rb", "test/test_each_with_context.rb", "test/test_helper.rb", "README.rdoc", "LICENSE"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/bkoski/each_with_context}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Get contextual information about an element in an each loop}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
