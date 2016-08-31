Rails.application.routes.draw do
  get 'home/index'

  devise_for :users
  root to: "home#index"

  namespace :api do
    resources :crawlers
    post "crawl_data", as: :crawl_data, to: "crawlers#crawl_data"
  end

  namespace :admin do
    root to: "application#index"
    resources :tests
    resources :users
  end
end

# Routes
# get '/undead', to: redirect('/zombies')

# "link_name" to "action_name" as "zombie_path"
# get '/all', to: 'zombies#index', as: zombie

# "root" localhost:3000/
# root to: 'zombies#index'
#
# get :decomp, on: :member => /zombies/:id/decomp specify 1 member :id
# get :decomp_group, on: :collection => /zombies/decomp_group specify a group contain a lot member

# <%= link_to 'All Zombies', zombies_path %>
#     <%= link_to 'New Zombie', new_zombie_path %>
#     <%= link_to 'Edit Zombie', edit_zombie_path(@zombie) %>
#     <%= link_to 'Show Zombie', zombie_path(@zombie) %>
#     <%= link_to 'Show Zombie', @zombie %>
#     <%= link_to 'Delete Zombie', @zombie, method: :delete %>
#
#
#     Nested Route
#     <% @tweets.each do |tweet| %>
#         <tr>
#           <td><%= tweet.body %></td>
#           <td><%= link_to 'Show', [@zombie, tweet] %></td>
#           <td><%= link_to 'Edit', edit_zombie_tweet_path(@zombie, tweet) %></td>
#           <td><%= link_to 'Destroy', [@zombie, tweet], method: :delete %></td>
#         </tr>
#     <% end %>
#     <%= link_to 'New Tweet', new_zombie_tweet_path(@zombie) %>