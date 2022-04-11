require "uri"
require "net/http"

class TrajetsController < ApplicationController
  skip_before_action :authenticate_user!, only: :new
  before_action :set_trajet, only: %i[show destroy edit update]

  def index
    @trajets = Trajet.all
    @trajet = Trajet.new
    google_api
  end

  def show
    google_api
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

  def google_api
    @google_api_key = ENV['GOOGLE']
  end

  def saisie 
  end


  def search(string)
    ascii_string = ActiveSupport::Inflector.transliterate(string)



    urlducontrolleur = '/trajets/search'

    url = URI("https://maps.googleapis.com/maps/api/distancematrix/json?origins=#{ascii_origin}&destinations=#{ascii_destination}&departure_time=#{ departure_time || "now"}&key=#{ENV['GOOGLE']}")
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)

    response = https.request(request)
    JSON.parse(response.read_body, object_class: Hash)
  end
end
