class AltFuelFinderService
  def initialize(filter = {})
    @filter = filter
  end

  def station_search
    #the zip is nil - not getting passed through search form
    get_json("/api/alt-fuel-stations/v1.json?api_key=#{ENV["nrel_api_key"]}&location=#{@filter[:zip]}&limit=10")
  end

  private

  def conn
    Faraday.new(url: "https://developer.nrel.gov") do |faraday|
      faraday.headers["X-API-Key"] = ENV["nrel_api_key"]
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
end
