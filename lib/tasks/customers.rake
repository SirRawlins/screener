# frozen_string_literal: true

# The invite operations.
require 'inviter'

namespace :customers do
    desc 'Finds customers to invite for dinner near to the Dublin office.'
    task :create_invite_list, [:input_path, :output_path, :within, :of] do |_t, args|
        # Default options for the invite list.
        args.with_defaults(
            # Within 100km.
            within: 100,
            # Of Intercoms Dublin HQ.
            of: '53.339428 -6.257664'.split(' '),
            # Exported to a file with a generic name.
            output_path: '/invitees.json'
        )

        # Run the operation to export the nearby customers
        # that we want to invite.
        Inviter.prepare_from_file(args.input_path, args.output_path, args.within, args.of)

        # Assuming the task completed
        # present a message to the user.
        puts 'Your customers invitee list is ready for you.'
    end
end
