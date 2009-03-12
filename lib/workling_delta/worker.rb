class WorklingDelta::Worker < Workling::Base
  def index(options = {})
    ThinkingSphinx::Deltas::DeltaJob.new(options[:delta_index_name]).perform
    
    if options[:document_id]
      ThinkingSphinx::Deltas::FlagAsDeletedJob.new(options[:core_index_name], 
        options[:document_id]).perform
    end
  end
end
