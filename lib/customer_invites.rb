# Libs for loading/exporting customers.
require 'customer_collection'
require 'customer_file'

#
# Class responsible for preparing customer invites
# finding who to invite, and preparing the invitee list.
#
class CustomerInvites

    class << self

        #
        # Takes the customer file and prepares an export
        # of customers we should invite, within a given
        # distance of the office.
        #
        def prepare_from_file(input_path, output_path, within, of)
            # Find and sort the nearby customers to
            # be exported.
            invitees = CustomerCollection.from_file(input_path).nearby(within, of)

            # Export the invitees.
            CustomerFile.write(
                # To the desired file.
                output_path,
                # Sorted by their user_id.
                invitees.sort_by { |customer| 
                    # Sort the customers for export.
                    customer['user_id'] 
                }
            )
        end

    end

end
