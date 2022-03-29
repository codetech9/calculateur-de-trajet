class Trajet < ApplicationRecord
  before_save :set_traffic_and_distance

  def time_with_traffic
    search['rows'][0]['elements'][0]['duration_in_traffic']['text']
  end

  private

  def set_traffic_and_distance
    self.time_without_traffic = search['rows'][0]['elements'][0]['duration']['text']
    self.distance = search['rows'][0]['elements'][0]['distance']['text']
  end

  def search
    ascii_origin = ActiveSupport::Inflector.transliterate(origin_addresse)
    ascii_destination = ActiveSupport::Inflector.transliterate(destination_addresse)
    url = URI("https://maps.googleapis.com/maps/api/distancematrix/json?origins=#{ascii_origin}&destinations=#{ascii_destination}&departure_time=now&key=#{ENV['GOOGLE']}")
    p url
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)

    response = https.request(request)
    JSON.parse(response.read_body, object_class: Hash)
  end
end
