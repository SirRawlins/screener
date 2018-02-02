# Geo-coding to help calculate distances.
require 'geocoder'

module Customer
	module Filters
		# Namespace for filters to sit in.
		class Nearby

		    class << self

		        #
		        # Take an array of customers and find those
		        # which are nearby, within a distance.
		        #
		        def find(customers, within, of)
		            # Collection of nearby customers.
		            nearby_customers = Collection.new

		            # Loop over the customer collection to
		            # find those nearby.
		            customers.each do |customer|
		                # Skip this customer if they're more
		                # then [X] kilometres away.
		                next if distance_between(of, customer_geo(customer)) > within.to_i

		                # This customer is nearby, so add them.
		                nearby_customers << customer
		            end

		            # Return those nearby.
		            nearby_customers
		        end

		        private

		            #
		            # Wrapper to get distance between two points
		            # in kilometres.
		            #
		            def distance_between(point_a, point_b)
		                # Geocoder library uses the Haversine formula and
		                # there's no use reinventing the wheel.
		                Geocoder::Calculations.distance_between(point_a, point_b, { :units => :km })
		            end

		            #
		            # Get a array of lat/long geo
		            # values for a customer from their
		            # hash of attributes.
		            #
		            def customer_geo(customer)
		                # Lat followed by long.
		                [customer['latitude'], customer['longitude']]
		            end

		    end
		    
		end
	end
end
