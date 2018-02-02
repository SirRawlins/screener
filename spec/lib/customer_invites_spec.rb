# frozen_string_literal: true

require 'spec_helper'
require 'customer_invites'

RSpec.describe CustomerInvites do

	describe "#prepare_from_file" do
		# Mock the input file.
		# Mock the path to the well formed file.
		let(:input_path) { '/spec/fixtures/customers.json' }
		# Mock a path to use for the output file.
		let(:output_path) { '/spec/tmp/customers-export.json' }

		# Get the expected file content from the fixtures.
		let(:expected_output_content) { File.open(File.expand_path("./spec/fixtures/invitees.json")).read }

		# Mock the result for testing.
		subject { described_class.prepare_from_file(input_path, output_path, 100, [53.339428, -6.257664]) }

		# Compare against the fixture data to see that
		# the expected file was generated.
		it { is_expected.to eq(expected_output_content) }
	end

end
