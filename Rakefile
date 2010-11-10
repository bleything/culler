require 'rubygems'
require 'hoe'

Hoe.plugin :isolate

Hoe.spec 'culler' do
  developer 'Ben Bleything', 'ben@bleything.net'

  ### Use markdown for changelog and readme
  self.history_file = 'CHANGELOG.md'
  self.readme_file  = 'README.md'

  ### Install thor and mongo
  self.extra_deps << [ 'thor',  '0.14.4' ]
  self.extra_deps << [ 'mongo', '1.1.2'  ]

  ### Use minitest for testing
  self.extra_dev_deps << ['minitest', '>= 1.7.0']
  self.testlib = :minitest
end
