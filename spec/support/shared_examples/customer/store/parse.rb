#
# Shared test cases for methods which accept a
# customer file and return a collection.
#
RSpec.shared_examples 'customer/store/parse' do

	# Include both good and bad examples.
	it_behaves_like 'customer/store/with_good_file'
	it_behaves_like 'customer/store/with_bad_file'

end
