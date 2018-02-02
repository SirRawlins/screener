# frozen_string_literal: true

require 'spec_helper'
require 'customer_collection'

RSpec.describe CustomerCollection do

	describe "Instance methods" do
		# Initialize a collection for testing.
		subject { described_class.new(customer_sample) }

		describe "#nearby" do
            # Mock some example customer hashes like those
            # which might be parsed from the file.
            #
            # Local to Dublin.
            let(:local_customer) { { 'latitude' => 53.349805, 'longitude' => -6.260310 } }
            # Further afield in London.
            let(:distant_customer) { { 'latitude' => 51.507351, 'longitude' => -0.127758 } }

            # Mock a sample with various customers.
            let(:customer_sample) { [local_customer, distant_customer] }

            # Get the result for testing.
            subject { super().nearby(100, [53.339428, -6.257664]) }

            # Expect an array in return.
            it { is_expected.to be_an(Array) }
            # Expect the result to include the appropriate
            # customer and not the other.
            it { is_expected.to include(local_customer) }
            it { is_expected.to_not include(distant_customer) }
		end
	end

	describe "Class methods" do
		describe "#from_file" do
			# Get the method result to test.
			subject { described_class.from_file(path) }

			context 'with a well-formed file' do
				# Mock the path to the well formed file.
				let(:path) { '/spec/fixtures/customers.json' }

				# Ensure the returned value looks good.
				it { is_expected.to be_an(Array) }
				it { is_expected.to have(32).items }
			end

			context 'with a well-formed, but spacey file' do
				# Mock the path to the well formed file.
				let(:path) { '/spec/fixtures/customers-with-blank-line.json' }

				# Ensure the returned value looks good.
				# It should skip and continue over the blank lines
				# and parse all the data.
				it { is_expected.to be_an(Array) }
				it { is_expected.to have(32).items }
			end

			context 'with a malformed file' do
				# Mock the path to the well formed file.
				let(:path) { '/spec/fixtures/customers-with-malformation.json' }

				it 'raises a JSON parsing error' do
					# It'll fail to parse the malformed JSON and inform
					# the user about this.
					expect { subject }.to raise_error(JSON::ParserError)
				end
			end

			context 'without a path' do
				# Mock a nil path.
				let(:path) { nil }

				it 'raises an argument error' do
					# Check it expects the path argument.
					expect { subject }.to raise_error(ArgumentError)
				end
			end
		end
	end

end
