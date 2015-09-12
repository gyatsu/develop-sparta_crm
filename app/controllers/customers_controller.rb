class CustomersController < ApplicationController
  def index
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new
    @customer.save
    redirect_to "/cutomser/#{coutomer.id}"
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end
end
