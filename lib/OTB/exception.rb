class JobQueueError < StandardError;

  def self.self_dependency_error
    exception message: "Self dependency error - A job cannot depend on itself", internal_code: 4009, code:409
  end

  def self.circular_dependecy_error
    exception message: "Circular dependency error - Jobs cannot depen on themselfves circularly creating an infinate loop", internal_code: 4009, code:409
  end


  def self.no_input_error
    exception message: "No input passed. jobs: was nill" , internal_code: 2004, code: 204
  end

end
