# frozen_string_literal: true

#
# Shared tests for a how a file parser behaves
# when passed a good file.
#
RSpec.shared_examples 'customer/store/with_good_file' do
    context 'with a well-formed file' do
        # Mock the path to the well formed file.
        let(:input_path) { '/spec/fixtures/customers.json' }

        # Ensure the returned value looks good
        it { is_expected.to be_an(Customer::Collection) }
        it { is_expected.to have(32).items }
    end

    context 'with a well-formed, but spacey file' do
        # Mock the path to the well formed file.
        let(:input_path) { '/spec/fixtures/customers-with-blank-line.json' }

        # Ensure the returned value looks good
        # It should skip and continue over the blank lines
        # and parse all the data.
        it { is_expected.to be_an(Customer::Collection) }
        it { is_expected.to have(32).items }
    end
end
