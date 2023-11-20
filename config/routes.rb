Rails.application.routes.draw do
  root "static_pages#home"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  get "/signup", to: "users#new"
  get "/interview", to: "interviews#interview" #help
  get "/interview/questions", to: "interviews#questions"
  get "/interview/wikipedia", to: "interviews#wikipedia"
  get "/interview/structure", to: "interviews#structure"
  get "/interview/tools", to: "interviews#tools"
  get "/interview/assignments", to: "interviews#assignments"
  get "/interview/dump", to: "interviews#dump"
end
