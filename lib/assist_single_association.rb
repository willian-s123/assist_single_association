require "assist_single_association/railtie"
require "assist_single_association/define"

module AssistSingleAssociation

  def self.extended(klass)
    Define.new(klass).execute
  end
end
