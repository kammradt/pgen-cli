# frozen_string_literal: true

require_relative 'lib/password_generator/version'

Gem::Specification.new do |spec|
  spec.name = 'password_generator_cli'
  spec.version = PasswordGenerator::VERSION
  spec.authors = ['Vinicius Kammradt']
  spec.email = ['vinicius.kammradt1@gmail.com']

  spec.summary = 'A password generator build on learning purpouses.'
  spec.homepage = 'https://github.com/kammradt/pgen-cli'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/kammradt/pgen-cli'
  spec.metadata['changelog_uri'] = 'https://github.com/kammradt/pgen-cli/blob/master/CHANGELOG.md'

  spec.description = <<~DESC
    ## Usage
    ### Install
    ```sh
    gem install password_generator_cli
    ```

    ### Examples
    ```sh
    # Generic usage
    pgen [OPTIONS]

    # Minimal example (using all defaults)
    #  12 chars, being a to z, A to Z, 0 to 9 and  ! to /
    pgen
    > 5ugvs5.JOv!1

    # Changing the default length
    pgen -l 32
    > mtu2WUh+M8ry2qw&YO#mI.Y!aSd43noi

    # Generating a pin (only numbers)
    pgen -p -l 8
    > 27843429

    # Generating without special characters (default is true)
    pgen -s false -l 8
    > HvLaAWB1
    ```
  DESC

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'bin'
  spec.executables = ['pgen']
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
