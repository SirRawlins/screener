# frozen_string_literal: true

require 'spec_helper'
require 'customer/collection'

RSpec.describe Customer::Collection do
    describe 'Instance methods' do
        # Initialize a collection for testing.
        subject { described_class.new(customer_sample) }

        describe '#nearby' do
            # Get the result for testing.
            subject { super().nearby(100, [53.339428, -6.257664]) }

            # Ensure it filters the customers.
            it_behaves_like 'customer/filters/nearby'
        end
    end

    describe 'Class methods' do
        describe '#from_file' do
            # Get the method result to test.
            subject { described_class.from_file(input_path) }

            # Generic file parser behaviour.
            it_behaves_like 'customer/store/parse'
        end
    end
end
