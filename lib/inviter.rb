# frozen_string_literal: true

# Include the customer interaction library.
require 'customer'

#
# Class responsible for for invitation generation from
# given input file, based on distance and location params.
#
class Inviter
    #
    # Takes the customer file and prepares an export
    # of customers we should invite, within a given
    # distance of the office.
    #
    def self.prepare_from_file(input_path, output_path, within, of)
        # Find and sort the nearby customers to
        # be exported.
        invitees = Customer::Collection.from_file(input_path).nearby(within, of)

        # Export the invitees.
        Customer::Store.write(
            # To the desired file.
            output_path,
            # Sorted by their user_id.
            invitees.sort_by do |customer|
                # Sort the customers for export.
                customer['user_id']
            end
        )
    end
end
