class TrajetsController < ApplicationController
  skip_before_action :authenticate_user!, only: :new
  before_action :set_trajet, only: %i[show destroy edit update]

  def index
    @trajets = Trajet.all
  end

  def show
  end

  def home
    @trajets-courants =Trajet.where(courant:true)
  end

  def create
    @trajet = Trajet.new(trajet_params)
    if @trajet.save
      redirect_to trajet_path(@trajet)
    else
      render :new
    end
  end

  def new
    @trajet = Trajet.new
  end

  def edit
  end

  def update
    if @trajet.update(trajet_params)
      redirect_to trajet_path(@trajet)
    else
      render :edit
    end
  end

  def destroy
    @trajet.destroy
    redirect_to trajets_path
  end


  private

  def set_trajet
    @trajet = Trajet.find(params[:id])
  end

  def trajet_params
    params.require(:trajet).permit(:origin_addresse, :destination_addresse)
  end
end
