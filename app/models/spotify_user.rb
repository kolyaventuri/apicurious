class SpotifyUser
  attr_reader :display_name,
    :uri,
    :href,
    :external_href,
    :type,
    :id

  def initialize(user_data)
    @display_name = user_data[:display_name]
    @uri = user_data[:uri]
    @href = user_data[:href]
    @external_href = user_data[:external_urls][:spotify]
    @id = user_data[:id]
    @type = user_data[:type]
  end
end
