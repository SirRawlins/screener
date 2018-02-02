require 'spec_helper'
require 'customer/store'

RSpec.describe Customer::Store do

    describe '#parse' do
        # Get the result for testing.
        subject { described_class.parse(input_path) }

        # Generic file parser behaviour.
        it_behaves_like 'customer/store/parse'
    end

    describe '#write' do
    	# Mock a temp file to hold the data.
    	let(:output_path) { 'spec/tmp/customer-export.json' }

    	# Read in the customer collection from the fixture
    	# to use in testing the write.
    	let(:customers) { described_class.parse('/spec/fixtures/customers.json') }

    	# Get the result for testing.
    	subject { described_class.write(output_path, customers) }

    	# Get the expected file content from the fixtures.
		let(:expected_output_content) { File.open(File.expand_path("./#{output_path}")).read }
    
		# Compare against the fixture data to see that
		# the expected file was generated.
		it { is_expected.to eq(expected_output_content) }
    end

end
