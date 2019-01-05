require 'pry'

module OTB
  class Job

    def initialize(jobs_string)
      @jobs_string = jobs_string
    end

    def self.parse(string: nil)
      jobs_array = string.split('\n')

      array_job_dependencies_sanitized= jobs_array.map do |job|
        job.scan(/(\w) => (\w|)/)
      end

      #binding.pry
    end

    private

  end
end
