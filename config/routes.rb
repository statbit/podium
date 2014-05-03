Podium::Application.routes.draw do
  root 'main#show'
  resource :main, only: :show

  get 'main/all_on_spotify' => 'main#all_on_spotify'
  get 'main/all_on_itunes' => 'main#all_on_itunes'

  get 'main/most_on_spotify' => 'main#most_on_spotify'
  get 'main/most_on_itunes' => 'main#most_on_itunes'

  get 'main/off' => 'main#off'
end
