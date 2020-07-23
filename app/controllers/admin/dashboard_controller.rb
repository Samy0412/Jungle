class Admin::DashboardController < ApplicationController
  def show

    @countProducts = Product.count

    @countCategories = Category.count

  end
end
