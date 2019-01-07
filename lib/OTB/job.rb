require 'pry'

module OTB
  class Job

    attr_accessor :job

    def initialize(job)
      @job = job
    end

    def self.parse(jobs)
      jobs_array = jobs.split('\n')
      result_hash = {}
      if jobs == ''
        result_hash[''] =''
        result_hash
      else
        array_job_dependencies_sanitized = jobs_array.each do |job_dependency|
            array_job_dependency = []
            array_job_dependency << job_dependency.split('=>')
            array_job_dependency.each do |job, dependency|
              if dependency.nil?; dependency = '' else dependency.strip! end
              result_hash[job.strip] = dependency
            end
        end
        result_hash
      end
    end
  end
end
