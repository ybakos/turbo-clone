require "turbo_clone/version"
require "turbo_clone/engine"

module TurboClone
  class << self
    attr_writer :signed_stream_verifier_key

    def signed_stream_verifier_key
      @signed_stream_verifier_key or raise ArgumentError, "Turbo requires a signed_stream_verifier_key"
    end
  end
end
