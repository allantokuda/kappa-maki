require 'multi_test'

module Cucumber
  module Features
    # This is the module where users will add their features.
  end

  class FeatureSteps
    def self.namespace
      self.name.split('::').last
    end

    def self.underscore_step_name(step_string)
      step_string.gsub(/[^a-zA-Z0-9!?]/, '_').downcase.to_sym
    end

    def self.camelize_feature_name(feature_name)
      feature_name.gsub(/[^a-zA-Z0-9!?]/, '')
    end

    def self.namespace_step(step_string)
      "[#{self.namespace}] #{step_string}"
    end

    def self.step(step_string, &block)
      if step_string.class == Regexp
        raise "Feature-scoped step definitions do not allow regular expressions. Use simple strings instead."
      end

      method_name = self.underscore_step_name(step_string)

      if method_name.length < 3
        raise "Step definition must be at least 3 characters long. Step: '#{step_string}'"
      end

      define_method(method_name, &block)

      namespaced_step = self.namespace_step(step_string)

      feature_class = self

      delegate_block = Proc.new do
        @instance = feature_class.new if @instance.class != feature_class
        MultiTest.extend_with_best_assertion_library(@instance)
        @instance.send method_name
      end

      Cucumber::RbSupport::RbDsl.register_rb_step_definition(namespaced_step, delegate_block)
    end

    # Basic `pending` support only: no support for passing a block (for now, for simplicity)
    def pending(message = "TODO")
      raise Pending, message
    end
  end
end

module SupportCode_NamespacedSteps
  # Override Cucumber's find_match method.
  def find_match(test_step)
    feature_name = test_step.source.first.short_name

    feature_namespace = Cucumber::FeatureSteps.camelize_feature_name(feature_name)
    underscored_step = Cucumber::FeatureSteps.underscore_step_name(test_step.name)

    # Instantiate the feature steps class for the duration of the scenario, if not already.
    # Instance variables will be scoped therein, and only usable for the life of the scenario.
    match = if Cucumber::Features.const_defined?(feature_namespace)
      feature_class = Cucumber::Features.const_get(feature_namespace)
      @feature ||= feature_class.new

      begin
        # Local (namespaced) step definitions override global ones, if both are defined.
        step_match(feature_class.namespace_step(test_step.name))
      rescue Cucumber::Undefined
        super
      end
    else
      super
    end

    @configuration.notify Cucumber::Events::StepMatch.new(test_step, match)

    # Need to copy Cucumber's dry-run check because the super method may never
    # be called in the case where the step is locally namespaced.
    if @configuration.dry_run?
      return Cucumber::SkippingStepMatch.new
    end
    match
  end
end

module Cucumber
  class Runtime
    # TODO: the find_match method has been moved to out of SupportCode and into
    # Filters::ActivateSteps in Cucumber 2.2.0. It will need to be moved for
    # kappa-maki as well.
    class SupportCode
      prepend SupportCode_NamespacedSteps
    end
  end
end
