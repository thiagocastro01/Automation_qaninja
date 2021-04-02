require "httparty"
require_relative "base_api"

class Sessions < BaseApi
  def create(payload)
    return self.class.post(
             "/sessions",
             body: payload.to_json,
             headers: { "Content-Type": "application/json" },
           )
  end
end
