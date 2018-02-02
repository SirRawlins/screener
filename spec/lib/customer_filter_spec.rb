# frozen_string_literal: true

require 'spec_helper'
require 'customer_filter'

RSpec.describe CustomerFilter do

    describe '#nearby' do
        # Get the result for testing.
        subject { described_class.nearby(customer_sample, 100, [53.339428, -6.257664]) }

        # Ensure it filters the customers.
        it_behaves_like 'customer_nearby_filter'
    end

end
