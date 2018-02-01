# frozen_string_literal: true

require 'geocoder'

class CustomerFilter

  class << self

  	#
  	# Take an array of customers and find those
  	# which are nearby, within a distance.
  	#
  	def nearby(customers, to)
  		# Collection of nearby customers.
  		nearby_customers = []

  		# Loop over the customer collection to
  		# find those nearby.
  		customers.each do |customer|
  			# Get the distance of this customer
  			# from base, in kilometres.
  			distance = Geocoder::Calculations.distance_between(to, [customer[:latitude], customer[:longitude]], { :units => :km })

  			if distance < 100
	  			# If distance is within the threshold 
	  			# Add them to the nearby collection.
	  			nearby_customers << customer
	  		end
  		end

  		# Return those nearby.
  		nearby_customers
  	end

  end

end
