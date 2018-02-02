#
# Shared tests for methods which filter a collection
# of customer records based on their geo location.
#
RSpec.shared_examples 'customer/filters/nearby' do

    # Mock some example customer hashes like those
    # which might be parsed from the file.
    #
    # Local to Dublin.
    let(:local_customer) { { 'latitude' => 53.349805, 'longitude' => -6.260310 } }
    # Further afield in London.
    let(:distant_customer) { { 'latitude' => 51.507351, 'longitude' => -0.127758 } }

    # Mock a sample with various customers.
    let(:customer_sample) { [local_customer, distant_customer] }

    # Expect an array in return.
    it { is_expected.to be_an(Array) }
    # Expect the result to include the appropriate
    # customer and not the other.
    it { is_expected.to include(local_customer) }
    it { is_expected.to_not include(distant_customer) }

end
