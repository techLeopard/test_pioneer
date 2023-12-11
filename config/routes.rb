Rails.application.routes.draw do
  root "static_pages#home"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  get "/signup", to: "users#new"

  scope '/interview' do
    get '/', to: 'interviews#index', as: 'interview'
    get '/notes', to: 'notes#index', as: 'interview_notes'
    get '/structure', to: 'interviews#structure', as: 'interview_structure'
    get '/dump', to: 'interviews#dump', as: 'interview_dump'
    get '/assignments', to: 'assignments#index', as: 'interview_assignments'
    post '/assignments', to: 'assignments#create' # если нужен
    get '/tools', to: 'tools#index', as: 'interview_tools'
    get '/stack', to: 'positions#index', as: 'interview_stack'
  end

  resources :positions do
    resources :sections do
      resources :articles
    end
    resources :tool_sections do
      resources :tools do
        resources :posts
        resources :features
      end
    end
  end
  

  resources :assignments

  resources :notes
end
