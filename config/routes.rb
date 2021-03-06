Rails.application.routes.draw do
  resources :product_items do
    collection do
      get "get_product_items"
      post "create_product_items"
      post "update_product_items"
      post "delete_product_items"
    end

  end
  resources :items do
    collection do
      get "get_items"
    end
  end
  devise_for :workers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :workers do
    collection do
      post "register"
      post "login"
      post "update_worker"
      post "delete_worker"
      get "get_all_workers"
    end
    member do 
      get :reset_password
      put :change_current_city
    end
  end
  resources :users do
    collection do
      post "register"
      post "login"
      post "update_user"
      post "delete_user"
      get "get_item"
      post "direct_charge"
      get "wallet"
      post "pay"
      post "youhui_charge"
      post "create_yonghui_charge_setting"
      post "delete_youhui_charge_setting"
      get "charge_list"
      post "cancel_order"
      post "refunds"
      post "request_cancel_order"

    end
  end

  resources :couriers do
    collection do
      post "register"
      post "login"
      post "createCouries"
      post "update_courier"
      post "delete_courier"
      get "get_courier_stations"
      post "allocate_couriers_stations"
      post "courier_shipping"
      post "courier_confirm_shipping"
      post "courier_arrived"
      post "change_courier_cal_rules"
      get "wallet"
      get "courier_cal_rule"
    end
  end
  resources :factories do
    collection do
      post "register"
      post "login"
      post "update_factory"
      post "delete_factory"
      get "get_factory_stations"
      post "allocate_factories_stations"
      post "factory_washing"
      post "factory_finish_washing"
      post "change_factory_cal_rules"
      get "wallet"
      get "factory_cal_rule"
    end
  end

  resources :roles do
    collection do
      get "get_roles"
      get "get_roles_items"
      post "create_roles"
      post "update_roles"
      post "delete_roles"
      post "assign_worker_role"
    end
  end

  resources :categories do
    collection do
      get "get_categories"
      get "get_categories_items"
      post "create_categories"
      post "update_categories"
      post "delete_categories"
    end
    member do 
      get :prices
      post :init_prices
    end
  end
  resources :products do
    collection do
      get "get_products"
      get "get_qiye_products"
      post "create_products"
      post "update_products"
      post "delete_products"
    end
  end

  resources :prices

  resources :price_rules

  resources :stations do 
    collection do
      get "get_station"
      get "get_station_address"
      post "create_station_address"
      post "update_station_address"
      post "delete_station_address"
    end
  end

  resources :regions do 
    collection do 
      get "get_cities"
      get "get_regions"
    end
  end

  resources :addresses do
    collection do
      get "get_user_address"
      post "create_user_address"
      post "update_user_address"
      post "delete_user_address"
      get "get_factory_address"
      post "create_factory_address"
      post "update_factory_address"
      post "delete_factory_address"
      get "get_courier_address"
      post "create_courier_address"
      post "update_courier_address"
      post "delete_courier_address"
    end
    collection do 
      get :suggestion
    end
  end
  resources :cities

  resources :orders do
    collection do
      get "get_all_orders"
      post "create_order"
      get "get_user_orders"
      get "get_all_cancel_orders"
      post "cancel_refund_order"
      post "refuse_cancel_order"
    end
  end

  resources :waybills do
    collection do
      get "get_waybills"
    end
  end

  resources :coupons do
    collection do
      get "get_user_coupons"
      post "send_coupons"
      get "get_coupon_list"
      post "create_coupons"
      post "delete_coupon"
      post "update_coupon"
      post "delete_order_promotions"
    end
  end
end