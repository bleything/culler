require 'hoe'

Hoe.plugin :doofus, :git

Hoe.spec 'culler' do
  developer 'Ben Bleything', 'ben@bleything.net'

  ### Use markdown for changelog and readme
  self.history_file = 'CHANGELOG.md'
  self.readme_file  = 'README.md'

  ### Install mongo
  self.extra_deps << [ 'bson_ext', '~> 1.3' ]
  self.extra_deps << [ 'mongoid',  '~> 2.2' ]
  self.extra_deps << [ 'progress', '~> 1.1' ]

  ### Use minitest for testing
  self.extra_dev_deps << [ 'minitest', '~> 2.0' ]
  self.testlib = :minitest
end
