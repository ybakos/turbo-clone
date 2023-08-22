module TurboClone
  module StreamsHelper
    def turbo_stream
      TurboClone::Streams::TagBuilder.new(self)
    end
  end
end
