# frozen_string_literal: true

require 'spec_helper'
require 'customer_filter'

RSpec.describe CustomerFilter do

    describe '#nearby' do
        # Get the result for testing.
        subject { described_class.nearby(customer_sample, home) }

        context 'and home is Dublin' do
            # Set home location as lat/long for Dublin.
            let(:home) { [53.339428, -6.257664] }

            # Mock some example customer hashes like those
            # which might be parsed from the file.
            #
            # Local to Dublin.
            let(:local_customer) { { :latitude => 53.349805, :longitude => -6.260310 } }
            # Further afield in London.
            let(:distant_customer) { { :latitude => 51.507351, :longitude => -0.127758 } }

            # Mock a sample with various customers.
            let(:customer_sample) { [local_customer, distant_customer] }

            # Expect an array in return.
            it { is_expected.to be_an(Array) }
            # Expect the result to include the appropriate
            # customer and not the other.
            it { is_expected.to include(local_customer) }
            it { is_expected.to_not include(distant_customer) }
        end
    end

end
