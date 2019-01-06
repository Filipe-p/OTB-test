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
     jobs_parsed.each do |job, dependency|
       if job == dependency
         raise JobQueueError.self_dependency_error
       end
     end
    end

    def check_circular_dependency(jobs_parsed)
     jobs_parsed.each_with_index do |job_dependency, index|
      [job_dependency].each do |job, dependency|
        if jobs_parsed.keys[0..index].include?(dependency)
          raise JobQueueError.circular_dependecy_error
        end
      end
     end
    end

    def sort_jobs_to_sequence(jobs_parsed)
    # puts 'Sorting a bunch of jobs'
    end
  end
end
