#require 'pry'
#module Cucumber
#  module Features
#  end
#
#  class FeatureSteps
#    include Cucumber::RbSupport::RbDsl
#    def self.step(regexp, &proc)
#      define_method regexp.to_s, &proc
#      namespace = self.name.split('::').last.downcase
#      Cucumber::RbSupport::RbDsl.register_rb_step_definition(regexp, proc, { namespace: namespace })
#    end
#  end
#end
