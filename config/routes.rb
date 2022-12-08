Rails.application.routes.draw do

# ゲストログイン用
devise_scope :customer do
   post 'customers/guest_sign_in', to: 'public/sessions#guest_sign_in'
end
# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# devise_scope :customers do
#   post 'customers/guest_sign_in' => 'public/sessions#guest_sign_in'
# end

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:passwords] ,controllers: {
  registrations: "admin/registrations",
  sessions: "admin/sessions"
}

 scope module: :public do
   root to: 'homes#top'
   get '/customers/my_page' => 'customers#show', as: 'my_page'
   get '/customers/infomation/edit' => 'customers#edit', as: 'edit_infomation'
   patch '/customers/infomation' => 'customers#update', as: 'infomation'
   get '/customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
   patch '/customers/withdraw' => 'customers#withdraw', as: 'withdraw'

   get 'search' => 'posts#search'

   resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
     resource :favorites, only: [:create, :destroy]
     resources :comments, only: [:create, :destroy]
   end
 end

 namespace :admin do
    get 'home' => 'homes#top'
    resources :tags, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :comments, only: [:index, :destroy]
 end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
