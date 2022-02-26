# Creating a singleton class to encapsulate the encode and decode
# methods required for the jwt athentication
class JsonWebToken
    # Methods defined inside of class << self
    # can be accessed without instantiating 
    # the class just by using the class name

    # singleton classes are used when you need to encapsulate
    # a bunch of method inside of a class

    # All methods defined inside of class << self are
    # the static methods that we find in JS
    class << self
        # encode method takes in a payload and returns a jwt

        # 24.hours.from_now is a method that returns a time object 
        # that is 24 hours in future from now

        # from_now is provided by active support gem
        def encode(payload, exp=24.hours.from_now)
            # payload is the data that we want to encode
            # exp is the expiration time
            payload[:exp] = exp.to_i

            # pass the payload & the unique base key of your rails
            # application to the encode method
            JWT.encode(payload, Rails.application.secrets.secret_key_base)
        end

        # the token is passed as argument to the decode method
        # It decrypts the token that is passed to it and returns it
        def decode(token)
          # The decoded result is an object & we are storing it in a
          # variable called as body
          body = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
          # HashWithIndifferentAccess provided by active support gem
          # HashWithIndifferentAccess allows us to access hashKey as a string
          # i.e hash[:a] & hash["a"] are the same
          # Here, the values of the body object can be accessed as strings
          HashWithIndifferentAccess.new body
        end
    end
end