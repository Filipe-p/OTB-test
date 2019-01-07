module OTB
  class Queue
    attr_accessor :jobs, :jobs_parsed

    #usign job:nil for stability & latter flexibity
        # Idea being you could also have string:nil
        # then you could initialized with Job objects in the jobs:
        # or you could initialized with String objects in the string:
    def initialize(string:nil)
     @jobs = string
     @jobs_parsed = OTB::Job.parse(@jobs) unless string.nil?
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
     jobs_parsed.each do |job, dependency|
       if job == dependency
         raise JobQueueError.self_dependency_error
       end
     end
    end

    def check_circular_dependency(jobs_parsed)
      hash_jobs_with_depencecies = {}

      jobs_parsed.each_with_index do |job_dependency, index|
      [job_dependency].each do |job, dependency|
        if hash_jobs_with_depencecies.keys.include?(dependency) && hash_jobs_with_depencecies.values.include?(job)
          raise JobQueueError.circular_dependecy_error
        end
        hash_jobs_with_depencecies[job] = dependency unless dependency.empty?
      end
     end
    end

    def sort_jobs_to_sequence(jobs_parsed)
      sequence = []

      jobs_parsed.each do |job, dependency|
        if dependency.empty?
          sequence << job unless sequence.include?(job)
        elsif sequence.include?(job)
          index = sequence.find_index(job)
          sequence.insert(index, dependency)
        else
          sequence << dependency unless sequence.include?(dependency)
          sequence << job unless sequence.include?(job)
        end
      end
      sequence.join(', ')
    end
  end
end

