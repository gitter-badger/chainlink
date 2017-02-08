class WeiWatchersClient

  include HttpClient
  base_uri ENV['WEI_WATCHERS_URL']

  def create_subscription(options = {})
    hashie_post('/subscriptions', {
      account: options[:account],
      endAt: (options[:endAt] || options[:end_at]).to_i.to_s,
      topics: options[:topics],
    }.compact)
  end

end
