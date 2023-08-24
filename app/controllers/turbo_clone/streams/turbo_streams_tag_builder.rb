module TurboClone
  module Streams
    module TurboStreamsTagBuilder
      private

      def turbo_stream
        TurboClone::Streams::TagBuilder.new(view_context)
      end
    end
  end
end
