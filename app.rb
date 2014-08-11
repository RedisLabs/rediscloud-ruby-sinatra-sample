require 'sinatra'
require 'redis'

configure do
  uri = URI.parse(ENV["REDISCLOUD_URL"])
  $redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
end

get '/' do
  File.read(File.join('views', 'index.html'))
end

get '/command' do
  @res= ''

  begin
    case params[:a]
      when 'set'
        @res = $redis.set('welcome_msg', 'Hello from Redis!')
      when 'get'
        @res = $redis.get('welcome_msg') || 'undefined'
      when 'info'
        $redis.info.each { |k, v| 
          @res += "#{k}: #{v}<br />" 
        }
      when 'flush'
        @res = $redis.flushall
    end
    
  rescue Redis::BaseConnectionError => e
    puts e.message
    @res = nil
  rescue SocketError => e
    puts e.message
    @res = nil
  end

  @res  
end
