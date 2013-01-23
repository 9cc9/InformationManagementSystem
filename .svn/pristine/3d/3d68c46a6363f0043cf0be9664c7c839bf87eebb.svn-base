InformationManagementSystem::Application.routes.draw do

  captcha_route

  resources :projects


  get "sessions/new"

  get "sessions/create"

  get "sessions/destroy"


  controller :project_process do
    get "pending_review_projects_list" => :pending_review_projects_list
    get "established_projects_list" => :established_projects_list
    get "pending_defense_projects_list" => :pending_defense_projects_list
    get "not_pass_projects_list" => :not_pass_projects_list
    match "pass_project/:id", :as => :pass_project,
          :via => :get,
          :action => :pass_project
    match "fund_management_show/:id", :as => :fund_management_show,
        :via => :get,
        :action => :fund_management_show
    match "add_fund_item/:id", :as => :add_fund_item,
          :via => :post,
          :action => :add_fund_item
    match "add_file_item/:id", :as => :add_file_item,
          :via => :post,
          :action => :add_file_item
    match "file_management_show/:id", :as => :file_management_show,
          :via => :get,
          :action => :file_management_show
  end

  controller :students do
    match "add_achievement_item/:id", :as => :add_achievement_item,
          :via => :post,
          :action => :add_achievement_item
    match "add_other_information_item/:id", :as => :add_other_information_item,
          :via => :post,
          :action => :add_other_information_item
    post "process_students_search" => :process_students_search
  end

  controller :projects do
    post "process_search" => :process_search
  end
  #get "project_process/new_project"
  #get "project_process/pending_review_projects_list"
  #get "project_process/established_projects_list"
  #get "project_process/pending_defense_projects_list"

  resources :students


  resources :users

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id))(.:format)'
end
