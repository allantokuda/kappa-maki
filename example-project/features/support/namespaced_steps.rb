#module Runtime_ExtensionForNamespacedSteps
#  def load_namespaced_step_definitions
#    puts 'loading namespaced step definitions!'
#  end
#
#  def load_step_definitions
#    super
#    load_namespaced_step_definitions
#  end
#end
#
#module Cucumber
#  class Runtime
#    prepend Runtime_ExtensionForNamespacedSteps
#  end
#end

module Cucumber
  module Features
    # This is the module where users will add their features.
  end

  class FeatureSteps
    def self.underscore(step_string)
      step_string.gsub(/[^a-zA-Z0-9!?]/, '_').downcase
    end

    def self.camelize(feature_name)
      feature_name.gsub(/[^a-zA-Z0-9!?]/, '')
    end

    def self.step(step_string, &block)
      if step_string.class == Regexp
        raise "Feature-scoped step definitions do not allow regular expressions. Use simple strings instead."
      end

      method_name = self.underscore(step_string)

      if method_name.length < 3
        raise "Step definition must be at least 3 characters long. Step: '#{step_string}'"
      end

      define_method(method_name, &block)

      # Not sure if I actaully want to do this. I'm more inclined to go higher in the chain to where it decides whether a method is defined or not. Then I wouldn't need to register a namespace. But trying this out anyway...
      Cucumber::RbSupport::RbDsl.register_rb_step_definition(step_string, block, { namespace: self.name })
    end
  end
end

AfterConfiguration do |config|
  # instantiate each of the feature methods
  Cucumber::Features.constants.each do |feature_name|
    feature = Cucumber::Features.const_get(feature_name)
    binding.pry
    0
  end
  0
end
