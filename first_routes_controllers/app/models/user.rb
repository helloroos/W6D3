class User < ApplicationRecord

    def inititialize(name, email)
        @name = name
        @email = email
    end
    
end