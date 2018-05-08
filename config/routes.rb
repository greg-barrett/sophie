Rails.application.routes.draw do
  root                      'static_pages#home'
  get        '/about', to:  'static_pages#about'

  get    '/vestments', to:  'static_pages#vestments'

  get   '/whats_new',  to:  'static_pages#whats_new'

  get     '/contact',  to:  'prospects#new'
  post    '/contact',  to:  'prospects#create'

end
