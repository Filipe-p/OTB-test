require 'pry'

module OTB
  class Queue
    attr_accessor :jobs
    #Intializing Queue
      #usign hash for parameter for
    def initialize(jobs:nil)
     @jobs = jobs
     ##if I check thing like this it will not exit
    end

    def sort_sequence
      case @jobs
        when ''
          ''
        when nil
          raise
        else
          'Not and empty string'
      end
    end

    private

    def check_nil?
      #self? Check if nill.
        # Raise Error no job to queue
    end

    def check_empty_string?
      @jobs == '' ? '' : false

    end

  end
end
