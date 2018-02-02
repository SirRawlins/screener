# frozen_string_literal: true

#
# Shared tests for a how a file parser behaves
# when passed a bad file.
#
RSpec.shared_examples 'customer/store/with_bad_file' do
    context 'with a malformed file' do
        # Mock the path to the well formed file.
        let(:input_path) { '/spec/fixtures/customers-with-malformation.json' }

        it 'raises a JSON parsing error' do
            # It'll fail to parse the malformed JSON and inform
            # the user about this.
            expect { subject }.to raise_error(JSON::ParserError)
        end
    end

    context 'without a path' do
        # Mock a nil path.
        let(:input_path) { nil }

        it 'raises an argument error' do
            # Check it expects the path argument.
            expect { subject }.to raise_error(ArgumentError)
        end
    end
end
