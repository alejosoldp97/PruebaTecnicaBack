$redis = Redis.new(url: 'redis://localhost:6379', ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE })
