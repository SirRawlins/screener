require 'spec_helper'
require 'customer/filters/nearby'

RSpec.describe Customer::Filters::Nearby do

    describe '#find' do
        # Get the result for testing.
        subject { described_class.find(customer_sample, 100, [53.339428, -6.257664]) }

        # Ensure it filters the customers.
        it_behaves_like 'customer/filters/nearby'
    end

end
