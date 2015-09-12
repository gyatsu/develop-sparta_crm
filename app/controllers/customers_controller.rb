class CustomersController < ApplicationController
  def index
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    # @customer.save
    # redirect_to "/customers/#{@customer.id}"
    if @customer.save
      redirect_to @customer
    else
      render :new
    end
  end
  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update_attributes(customer_params)
    # @customer.save
    # redirect_to "/customers/#{@customer.id}"
    if @customer.save
      redirect_to @customer
    else
      render :edit
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def destroy
    @customer = Customer.find(params[:id])
    @custoemr.destroy
    redirect_to customers_url
  end
private
  def customer_params
    params.require(:customer).permit(
      :family_name,
      :given_name,
      :mail
      )
  end
end


