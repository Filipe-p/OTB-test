require 'pry'

module OTB
  class Queue
    attr_accessor :jobs, :jobs_parsed
    #Intializing Queue
      #usign hash for parameter for
    def initialize(jobs:nil)
     @jobs = jobs
     ##if I check thing like this it will not exit
     #binding.pry

     @jobs_parsed = OTB::Job.parse(string: @jobs) unless jobs.nil?
    end

    def sort_sequence
      case @jobs
        when ''
          ''
        when nil
          raise JobQueueError.no_input_error
        else
          check_self_dependency
          check_circular_dependency
          sort_jobs_to_sequence
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

    def check_self_dependency
     # puts 'checking the self dependency'
    end

    def check_circular_dependency
     # puts 'checking the circular dependency'
    end

    def sort_jobs_to_sequence
    # puts 'Sorting a bunch of jobs'
    end
  end
end
