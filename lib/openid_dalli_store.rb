require 'openid/store/memcache'

module OpenID
  module Store
    class Memcache
      undef use_nonce
      def use_nonce(server_url, timestamp, salt)
        return false if (timestamp - Time.now.to_i).abs > Nonce.skew
        ts = timestamp.to_s # base 10 seconds since epoch
        nonce_key = key_prefix + 'N' + server_url + '|' + ts + '|' + salt
        result = @cache_client.add(nonce_key, '', expiry(Nonce.skew + 5))
        if result.is_a? String
          return !!(result =~ /^STORED/)
        else
          return result == true
        end
      end

      protected

      undef delete
      def delete(key)
        result = @cache_client.delete(key)
        if result.is_a? String
          return !!(result =~ /^DELETED/)
        else
          return result == true
        end
      end
    end
  end
end