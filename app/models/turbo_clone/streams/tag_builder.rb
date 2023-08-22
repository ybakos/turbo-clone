module TurboClone::Streams
  class TagBuilder

    def initialize(view_context)
      @view_context = view_context
    end

    def replace(target, **rendering)
      action :replace, target, **rendering
    end

    private

    def action(name, target, **rendering)
      template = render_template(target, **rendering)
      turbo_stream_action_tag(name, target: target, template: template)
    end

    def turbo_stream_action_tag(action, target:, template:)
      template = "<template>#{template}</template>"
      if target = convert_to_turbo_stream_dom_id(target)
        %[<turbo-stream target="#{target}" action="#{action}">#{template}</turbo-stream>].html_safe
      else
        raise ArgumentError, "target must be supplied"
      end
    end

    def convert_to_turbo_stream_dom_id(target)
      if target.respond_to? :to_key
        ActionView::RecordIdentifier.dom_id(target)
      else
        target
      end
    end

    def render_template(target, **rendering)
      if rendering.any?
        @view_context.render(**rendering, formats: :html)
      else
        @view_context.render(partial: target, formats: :html)
      end
    end

  end
end
