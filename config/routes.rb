Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/product" => "products#product"

    get "/products" => "products#products"

    get "/single_query_search" => "products#single_product"

    get "/single_segment_search/:id" => "products#single_product"
    
  end

end
