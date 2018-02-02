# frozen_string_literal: true

require 'spec_helper'
require 'customer_collection'
require 'support/shared_examples/customer_file_parser'
require 'support/shared_examples/customer_nearby_filter'

RSpec.describe CustomerCollection do

	describe 'Instance methods' do
		# Initialize a collection for testing.
		subject { described_class.new(customer_sample) }

		describe '#nearby' do
            # Get the result for testing.
            subject { super().nearby(100, [53.339428, -6.257664]) }

            # Ensure it filters the customers.
            it_behaves_like 'customer_nearby_filter'
		end
	end

	describe 'Class methods' do
		describe '#from_file' do
			# Get the method result to test.
			subject { described_class.from_file(path) }

			# Generic file parser behaviour.
			it_behaves_like 'customer_file_parser' 
		end
	end

end
