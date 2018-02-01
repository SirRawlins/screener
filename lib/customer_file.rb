require 'json'

class CustomerFile

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
      customers = []

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

    private

      # Convert a single JSON encoded line
      # into a usable hash.
      def parse_customer(line)
        # Parse the JSON customer into something
        # more usable, like a hash.
        JSON.parse(line).to_h
      end

  end

end
