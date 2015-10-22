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
    def self.short_name
      self.name.split('::').last 
    end

    def self.underscore(step_string)
      step_string.gsub(/[^a-zA-Z0-9!?]/, '_').downcase.to_sym
    end

    def self.camelize(feature_name)
      feature_name.gsub(/[^a-zA-Z0-9!?]/, '')
    end

    def self.namespace_step(step_string)
      "[#{self.short_name}] #{step_string}"
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

      namespaced_step = self.namespace_step(step_string)

      feature_class = self

      delegate_block = Proc.new do
        @instance ||= feature_class.new
        @instance.send method_name
      end

      Cucumber::RbSupport::RbDsl.register_rb_step_definition(namespaced_step, delegate_block)
    end
  end
end

class StepDefinitionBridge
  attr_reader :feature, :step

  def initialize(feature, step)
    @feature = feature
    @step = step
  end

  def location
    step.location
  end

  def invoke(args)
    feature.send(step)
  end
end

module SupportCode_NamespacedSteps
  def find_match(test_step)
    namespace = Cucumber::FeatureSteps.camelize test_step.source.first.short_name
    feature = Cucumber::Features.const_get namespace
    @feature ||= feature.new
    underscored_step = Cucumber::FeatureSteps.underscore(test_step.name)

    begin
      step_match(feature.namespace_step(test_step.name))
    rescue Cucumber::Undefined
      super
    end
  end
end

module Cucumber
  class Runtime
    class SupportCode
      prepend SupportCode_NamespacedSteps
    end
  end
end

AfterConfiguration do |config|
  # TODO: instantiate each of the feature methods
  Cucumber::Features.constants.each do |feature_name|
    feature = Cucumber::Features.const_get(feature_name)
  end
end
