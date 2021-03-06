class CustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  def index
    # @customers = Customer.page(params[:page])
    @q = Customer.company_order.ransack(params[:q])
    # @q = Customer.ransack(params[:q])
    @customers = @q.result.page(params[:page])
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
    # @customer = Customer.find(params[:id])
  end

  def update
    # @customer = Customer.find(params[:id])
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
    # @customer = Customer.find(params[:id])
    @comment = Comment.new # これをform_forで使う
  end

  def destroy
    # @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to customers_url
  end
private
  def set_customer
    @customer = Customer.find(params[:id])
  end
  def customer_params
    params.require(:customer).permit(
      :family_name,
      :given_name,
      :mail,
      :company_id
      )
  end
end


