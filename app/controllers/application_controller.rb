class ApplicationController < ActionController::API
    SECRET_KEY = 'codesalley'
    ALGO = 'HS256'

    def auth_token(token)
        begin
            decoded_token = JWT.decode token, SECRET_KEY, true, { algorithm: ALGO }
            return true
          rescue JWT::ExpiredSignature
            return false
        end
    end
    def decode_token(token)
        begin
            decoded_token = JWT.decode token, SECRET_KEY, true, { algorithm: ALGO }
            return decode_token
          rescue JWT::ExpiredSignature
            return false
        end
    end
end
