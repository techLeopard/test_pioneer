Rails.application.routes.draw do
  root "static_pages#home"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  get "/signup", to: "users#new"


  scope '/learning' do
    get '/', to: 'learning#index', as: 'learning'
    get '/notes', to: 'notes#index', as: 'learning_notes'
    get '/structure', to: 'learning#structure', as: 'learning_structure'
    get '/dump', to: 'learning#dump', as: 'learning_dump'
    get '/assignments', to: 'assignments#index', as: 'interview_assignments'
    post '/assignments', to: 'assignments#create' # если нужен
    get '/tools', to: 'tools#index', as: 'learning_tools'
    get '/stack', to: 'positions#index', as: 'learning_stack'
    get '/remarks', to: 'remarks#index', as: 'learning_remarks'
  end

  get '/software-dev', to: 'software_dev#index', as: 'software_dev'
  get '/software-test', to: 'software_test#index', as: 'software_test' # as: это в каком виде прописывать path

  resources :positions do
    resources :sections do
      resources :articles do
        resources :practical_tasks
      end
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

  resources :remarks

  resources :flows

end
