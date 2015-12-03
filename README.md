# Kappa-Maki Gem

## Overview

**kappa-maki** gives Cucumber users the option to write local step definitions and pure ruby methods, both declared as belonging only to a particular feature, and not usable for testing any other feature. This provides encapsulation, for large and complex projects that may encounter difficulty scaling their Cucumber test suite. This is based on the same operating principles as [Spinach](http://codegram.github.io/spinach/).

The gem does not prevent the declaration use of normal globally shared (entire-World) steps. If both are defined with the same string, the local step definition takes precedence.

## Getting started

* Include in your `Gemfile`:

    gem 'kappa-maki'

* Include in your `hooks.rb`:

    require 'kappa-maki'

* Define steps and local methods inside classes:

    class Cucumber::Features::CoolCalculator < Cucumber::FeatureSteps
      step 'I have entered two numbers into the calculator' do
        enter_two_numbers
        puts 'I entered two numbers'
      end

      step 'I press Add' do
        puts 'I pressed Add'
      end

      step 'the result should be the sum of the two numbers' do
        puts 'Result was sum of two numbers'
      end

      # Local method!
      def enter_two_numbers
        puts 'Entering two numbers 12 and 42'
      end
    end


## Notes:

* The `step` method is used instead of `Given`, `When`, `Then`, etc.
* The `Cucumber::FeatureSteps` is the superclass. The `<` declares that this class is an inheritor. Make a class like this for each feature.
* The class name e.g. `Cucumber::Features::CoolCalculator` must exactly match the feature named in the feature file, e.g. `Feature: Cool Calculator`, minus any spaces or punctuation.

## Author's comments

After happily working on a project that was tested with Spinach, I then began working to another project that was using Cucumber and I couldn't stand the essentially-global namespace! I want to be able to share some things, but not everything. In particular, I want to be able to define local Ruby methods. This gem provides a transparent drop-in solution.

