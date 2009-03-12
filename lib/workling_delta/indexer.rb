module WorklingDelta
  class Indexer < ThinkingSphinx::Deltas::DefaultDelta
    def index(model, instance = nil)
      doc_id = instance ? instance.sphinx_document_id : nil
      WorklingDelta::Worker.async_index(:delta_index_name => delta_index_name(model), 
        :document_id => doc_id, :core_index_name => core_index_name(model))
      
      true
    end
  end
end
