require 'rake/testtask'
require 'rake/rdoctask'
#require 'meta_project'
require 'rake/contrib/rubyforgepublisher'
require 'fileutils'

task :default => [:build_extension, :move_extension, :test, :clean_extension]
task :clean => [:clean_extension]

task :build_extension do
  Dir.chdir('ext') do
    system "ruby extconf.rb > BUILD.LOG"
    system "make > BUILD.LOG"
  end
end

task :move_extension do
  FileUtils.mkdir_p 'lib/net'
  FileUtils.mv 'ext/geoip.bundle', 'lib/net/geoip.bundle'
end

task :clean_extension do
  FileUtils.rm_r('lib/net')
  Dir.chdir('ext') do
    system "make distclean"
  end
  FileUtils.rm('ext/BUILD.LOG')
end

task :clean_rdoc do
  FileUtils.rm_r('html')
end

Rake::TestTask.new do |t|
  t.libs << "test"
  t.libs << "ext"
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
end

# Create a task to build the RDOC documentation tree.
rd = Rake::RDocTask.new("rdoc") do |rdoc|
  rdoc.rdoc_dir = 'html'
  rdoc.title    = "Net::GeoIP"
  rdoc.options << '--line-numbers' << '--inline-source' << '--main' << 'README'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb', 'doc/**/*.rdoc', 'ext/**/*.c')
end

# Publish documentation to RubyForge
task :publish_doc => [:rdoc] do
  publisher = Rake::RubyForgePublisher.new('net-geoip', ENV['RUBYFORGE_USER'])
  publisher.upload
end
