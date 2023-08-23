module TurboClone
  module TestAssertions
    extend ActiveSupport::Concern

    included do
      delegate :dom_id, to: ActionView::RecordIdentifier
    end

    def assert_turbo_stream(action:, target: nil, status: :ok)
      assert_response status
      assert_equal Mime[:turbo_stream], response.media_type
      selector = %(turbo-stream[action="#{action}"])
      selector << %([target="#{target}"]) if target
      assert_select selector, count: 1
    end
  end
end