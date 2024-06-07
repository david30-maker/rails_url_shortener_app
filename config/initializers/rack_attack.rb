class Rack::Attack
    throttle('req/ip', limit: 5, period: 5) do |req|
        req.ip
    end
end