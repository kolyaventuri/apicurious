class Playlist
  def initialize(playlist_data)
    playlist_data.each_pair do |key, value|
      instance_variable_set("@#{key}", value)
      self.class.send(:define_method, key.to_sym) do
        instance_variable_get("@" + key.to_s)
      end
    end
  end
end
