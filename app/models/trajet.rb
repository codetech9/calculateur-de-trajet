class Trajet < ApplicationRecord
  before_save :set_traffic_and_distance

  attr_accessor :time

  def time_with_traffic(time)
    search(time)['rows'][0]['elements'][0]['duration_in_traffic']['text']
  end

  def bouchon?(time)
    time_with_traffic = time_with_traffic(time)
    traffic_int = time_as_int(time_with_traffic)
    no_traffic_int = time_as_int(time_without_traffic)
    traffic_int - no_traffic_int > 0
  end

  def time_as_int(string)
    array = string.split(' ')
    if array.size > 2
      hours = array[0].to_i
      minutes = array[2].to_i
    else
      hours = 0
      minutes = array[0].to_i
    end
    time = (Time.now + hours.hours + minutes.minutes).to_i
  end

  private

  def set_traffic_and_distance
    self.time_without_traffic = search('now')['rows'][0]['elements'][0]['duration']['text']
    self.distance = search('now')['rows'][0]['elements'][0]['distance']['text']
  end

  def search(time)
    unless time == 'now'
      departure_date_time = Time.now + time.to_i.hours
      departure_time = departure_date_time.to_i
    else
      departure_time = time
    end

    ascii_origin = ActiveSupport::Inflector.transliterate(origin_addresse)
    ascii_destination = ActiveSupport::Inflector.transliterate(destination_addresse)
    url = URI("https://maps.googleapis.com/maps/api/distancematrix/json?origins=#{ascii_origin}&destinations=#{ascii_destination}&departure_time=#{departure_time}&key=#{ENV['GOOGLE']}")
    p url
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)

    response = https.request(request)
    JSON.parse(response.read_body, object_class: Hash)
  end
end
