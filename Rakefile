require 'rubygems'
require 'hoe'

Hoe.plugin :isolate

Hoe.spec 'culler' do
  developer 'Ben Bleything', 'ben@bleything.net'

  ### Use markdown for changelog and readme
  self.history_file = 'CHANGELOG.md'
  self.readme_file  = 'README.md'

  ### Install thor and mongoid
  self.extra_deps << [ 'thor',    '0.14.4'   ]

  self.extra_deps << [ 'bson',    '~> 1.0.1' ]
  self.extra_deps << [ 'mongoid', '1.9.2'    ]

  ### Use minitest for testing
  self.extra_dev_deps << ['minitest', '>= 1.7.0']
  self.testlib = :minitest
end
