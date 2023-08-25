module TurboClone
  class StreamsChannel < ActionCable::Channel::Base
    def self.stream_name_from(streamables)
      if streamables.is_a?(Array)
        streamables.map { |streamable| stream_name_from(streamable) }.join(":")
      else
        streamables.then do |streamable|
          streamable.respond_to?(:to_key) ? ActionView.RecordIdentifier.dom_id(streamable) : streamable
        end
      end
    end

    def subscribed
      stream_from params[:signed_stream_name]
    end
  end
end
