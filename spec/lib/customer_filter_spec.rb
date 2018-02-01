# frozen_string_literal: true

require 'spec_helper'
require 'customer_filter'

RSpec.describe CustomerFilter do

    describe '#nearby' do
        # Get the result for testing.
        subject { described_class.nearby(customer_sample, [51.507351, -0.127758]) }

        # Mock some example customer hashes like those
        # which might be parsed from the file.
        #
        # We only need location details.
        let(:local_customer) { { :latitude => "51.236220", :longitude => "-0.570409"} }
        let(:distant_customer) { { :latitude => "53.349805", :longitude => "-6.260310"} }

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
