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
    get '/dump', to: 'interviews#dump', as: 'interview_dump'
    get '/assignments', to: 'assignments#index', as: 'interview_assignments'
    post '/assignments', to: 'assignments#create' # если нужен
    get '/tools', to: 'tools#index', as: 'interview_tools'
  end

  resources :sections do
    resources :articles
  end

  resources :assignments

  resources :tools do
    resources :posts
    resources :features
  end

end
