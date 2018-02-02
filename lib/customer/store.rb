# JSON Decoder/Encoder.
require 'json'

module Customer
	#
	# Class responsible for reading/writing customer
	# records too and from text files with JSON
	# encoded customers.
	#
	class Store

	    class << self

	        # 
	        # Parse a given customer file into a
	        # more usable object within ruby.
	        # 
	        def parse(path)
	            # Ensure that a path is passed.
	            raise ArgumentError.new('Please provide a file path') if path.nil?

	            # Build an empty collection for
	            # the parsed customers to sit in.
	            customers = Collection.new

	            # The file format isn't JSON so we can't parse it verbatim
	            # instead we must read each line and parse each
	            # customer separately.
	            File.foreach(File.expand_path("./#{path}")) do |line|
	                # Skip empty lines, no need to process
	                # them, also no need to fail.
	                next if line.chomp.empty?

	                # Parse the line and append it to the collection
	                # of customers.
	                customers << parse_customer(line)
	            end

	            # Return the collection
	            customers
	        end

	        #
	        # Write a collection of customers to
	        # a file in a similar format to which
	        # they arrived.
	        #
	        def write(path, customers)
	            # Get absolute path for the new file,
	            absolute_path = File.expand_path("./#{path}")

	            # Open a file to be overwritten with the new
	            # customer data.
	            File.open(absolute_path, "w+") do |f|
	                # Loop over the collection of customers.
	                customers.each do |customer| 
	                    # Add the JSON formatted customer to the file.
	                    f.puts serialize_customer(customer)
	                end
	            end

	            # Return the newly generated file.
	            File.read(absolute_path)
	        end

	        private

	            # Convert a single JSON encoded line
	            # into a usable hash.
	            def parse_customer(line)
	                # Parse the JSON customer into something
	                # more usable, like a hash.
	                JSON.parse(line).to_h
	            end

	            # Convert a customer record into
	            # JSON format for storage.
	            def serialize_customer(customer)
	                # Simple JSON from hash.
	                customer.to_json
	            end

	    end

	end
end
