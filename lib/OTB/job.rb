module OTB
  class Job

    attr_accessor :job

    def initialize(job)
      # Further version of the code might want to change the initialization and create several Job objects.
      # These could then be saved in the DB as such or passed to the queuer.
      @job = job
    end

    def self.parse(jobs)
      jobs_array = jobs.split('\n')
      result_hash = {}
      if jobs == ''
        result_hash[''] =''
        result_hash
      else
        jobs_array.each do |job_dependency|
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
