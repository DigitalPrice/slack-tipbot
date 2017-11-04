module Bitcoin
  class Client
    def self.local
      return Bitcoin::Client.new(ENV['RPC_USER'], ENV['RPC_PASSWORD'],
        { host: '127.0.0.1', port: 42743, ssl: false} )
    end
  end
end
