require 'spec_helper'
require 'inviter'

RSpec.describe Inviter do

	describe "#prepare_from_file" do
		# Mock the result for testing.
		subject do
			# Call the method with the contextual input
			# and some generic nearby filter attributes.
			described_class.prepare_from_file(input_path, '/spec/tmp/customers-export.json', 100, [53.339428, -6.257664])
		end

		context "With a good input file" do
			# Mock the input file.
			# Mock the path to the well formed file.
			let(:input_path) { '/spec/fixtures/customers.json' }

			# Get the expected file content from the fixtures.
			let(:expected_output_content) { File.open(File.expand_path("./spec/fixtures/invitees.json")).read }

			# Compare against the fixture data to see that
			# the expected file was generated.
			it { is_expected.to eq(expected_output_content) }
		end

		context "With a bad input file" do
			# Fails with parse error when bad file
			# is supplied as input_path.
			it_behaves_like 'customer/store/with_bad_file'
		end
	end

end
