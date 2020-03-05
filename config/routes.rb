Rails.application.routes.draw do
  mount ActionCable.server, at: '/cable'
  post "/graphql", to: "graphql#execute"
end
