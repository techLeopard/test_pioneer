Rails.application.routes.draw do
  root "static_pages#home"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  get "/signup", to: "users#new"

  scope '/interview' do
    get '/', to: 'interviews#index', as: 'interview'
    get '/questions', to: 'interviews#questions', as: 'interview_questions'
    get '/wikipedia', to: 'sections#index', as: 'interview_wikipedia'
    get '/structure', to: 'interviews#structure', as: 'interview_structure'
    get '/tools', to: 'interviews#tools', as: 'interview_tools'
    get '/dump', to: 'interviews#dump', as: 'interview_dump'
    get '/assignments', to: 'assignments#index', as: 'interview_assignments'
    post '/assignments', to: 'assignments#create' # если нужен
  end

  resources :sections do
    resources :articles
  end

  resources :assignments
end
