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

      # binding.pry


      if jobs_array == ''
        result_hash[''] =['']
      else
        array_job_dependencies_sanitized = jobs_array.each do |job_dependency|
            array_job_dependency = []
            array_job_dependency << job_dependency.split('=>')
            array_job_dependency.each do |job, dependency|
              result_hash[job.chop] = dependency.chop
            end
        end

        p @result_hash = result_hash
        p result_hash
        result_hash
        #binding.pry

      end

    end


    # Get a String,
    # split(/n) => array with the Jobs individual string
    # for each, maybe a map, do a split(=>)
    # stick result in hash or do the map end in hash
    #

    private

  end
end
