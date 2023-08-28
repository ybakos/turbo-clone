module TurboClone
  module Broadcastable
    extend ActiveSupport::Concern

    class_methods do
      def broadcast_target_default
        model_name.plural
      end
    end

    def broadcast_append_to(*streamables, target: broadcast_target_default)
    end

    private

    def broadcast_target_default
      self.class.broadcast_target_default
    end
  end
end
