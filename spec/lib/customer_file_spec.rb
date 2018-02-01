# frozen_string_literal: true

require 'spec_helper'
require 'customer_file'

RSpec.describe CustomerFile do

  describe '#parse' do
    # Get the result for testing.
    subject { described_class.parse(path) }

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
