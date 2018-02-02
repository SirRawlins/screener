module Customer
	# Represents a collection of customer records
	# basically an array with a few helper methods.
	class Collection < Array

		#
		# Filter the collection of customers
		# to those within a given range of a certain
		# geographic location.
		#
		def nearby(within, of)
			# Use the filters to do this.
			Customer::Filters::Nearby.find(self, within, of)
		end

		class << self

			#
			# Get a collection of customers from
			# a given file.
			#
			def from_file(file_path)
				# Use the file reader to parse
				# the collection.
				Customer::Store.parse(file_path)
			end

		end

	end	
end
