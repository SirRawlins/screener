# frozen_string_literal: true

require 'spec_helper'
require 'customer_file'
require 'support/shared_examples/customer_file_parser'

RSpec.describe CustomerFile do

    describe '#parse' do
        # Get the result for testing.
        subject { described_class.parse(path) }

        # Generic file parser behaviour.
        it_behaves_like 'customer_file_parser'
    end

end
