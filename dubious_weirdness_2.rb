# This is a little more revealing
#
# When I compile the form helper and then the controller, I get an inference error.
#
require 'rubygems'
require 'rake'

load 'Rakefile'

Rake.application.options.trace =true
Rake.application.options.trace_rules = true 

puts CLASSPATH
chdir 'src' do
  args = ['-d',OUTDIR, '--classpath', CLASSPATH, 'dubious/form_helper.duby']

  Duby.compile *args
  Duby.reset

end

chdir 'examples/contacts/app' do
  args = ['-d',OUTDIR, '--classpath', CLASSPATH, 'controllers/contacts_controller.mirah']

  Duby.compile *args #happens here
  Duby.reset
end