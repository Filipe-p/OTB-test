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

     @jobs_parsed = OTB::Job.parse(@jobs) unless jobs.nil?
    end

    def sort_sequence
      case @jobs
        when ''
          ''
        when nil
          raise JobQueueError.no_input_error
        else
          check_self_dependency(@jobs_parsed)
          check_circular_dependency(@jobs_parsed)
          sort_jobs_to_sequence(@jobs_parsed)
      end
    end

    private

    def check_self_dependency(jobs_parsed)
     # puts 'checking the self dependency'
    end

    def check_circular_dependency(jobs_parsed)
     # puts 'checking the circular dependency'
    end

    def sort_jobs_to_sequence(jobs_parsed)
    # puts 'Sorting a bunch of jobs'
    end
  end
end
