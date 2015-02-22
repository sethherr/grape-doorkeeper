module API
  class Dispatch < Grape::API
    mount API::V1::Root
    format :json
    route :any, '*path' do
      Rack::Response.new({message: "Not found"}.to_json, 404).finish
    end
  end

  Base = Rack::Builder.new do
    use API::Logger
    run API::Dispatch
  end
end