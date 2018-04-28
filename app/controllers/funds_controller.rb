class FundsController < ApplicationController
  protect_from_forgery except: :index
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_fund, only: [:show, :edit, :update, :destroy]

# GET /funds
# GET /funds.json
def index
  if params[:q].present?
    @funds = Tag.where('name like ?', "%#{params[:q]}%").first
    if @funds
    else
      render "index2.js.erb"
    end
  else
    @funds = Fund.all
  end
end

# GET /funds/1
# GET /funds/1.json
def show
end

# GET /funds/new
def new
  @fund = Fund.new
end

# GET /funds/1/edit
def edit
  if current_user.admin?
  else
    render 'show'
  end
end

# POST /funds
# POST /funds.json
def create
  @fund = Fund.new(fund_params)
  respond_to do |format|
    if @fund.save
      format.html { redirect_to @fund, notice: 'El fondo fue creado exitosamente.' }
      format.json { render :show, status: :created, location: @fund }
    else
      format.html { render :new }
      format.json { render json: @fund.errors, status: :unprocessable_entity }
    end
  end
end

# PATCH/PUT /funds/1
# PATCH/PUT /funds/1.json
def update
  respond_to do |format|
    if @fund.update(fund_params)
      @fund.tags << Tag.find(tag_params[:id]) if tag_params[:id] != ""
      flash.now[:notice] = "El fondo #{@fund.name} fue actualizado con éxito."
      format.html { redirect_to @fund }
      format.json { render :show, status: :ok, location: @fund }
      format.js
    else
      format.html { render :edit }
      format.json { render json: @fund.errors, status: :unprocessable_entity }
      format.js
    end
  end
end

# DELETE /funds/1
# DELETE /funds/1.json
def destroy
  @fund.destroy
  respond_to do |format|
    format.html { redirect_to funds_url, notice: 'Fund was successfully destroyed.' }
    format.json { head :no_content }
  end
end

private
# Use callbacks to share common setup or constraints between actions.
def set_fund
  @fund = Fund.find(params[:id])
end

# Never trust parameters from the scary internet, only allow the white list through.
def fund_params
  params.require(:fund).permit(:name, :institution, :description, :amount, :start, :end, :url, tag_ids:[])
end

def tag_params
  params.require(:fund).require(:tag).permit([:id])
end
end
