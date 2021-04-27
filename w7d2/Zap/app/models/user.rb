class User < ApplicationRecord
    after_initialize :ensure_session_token

    def self.find_by_credentials(email, password)
        user = User.find_by(email: email)

        return user if user && user.is_password(password)
        nil
    end

    def self.generate_session_token
        @sesh_token = SecureRandom::urlsafe_base64
    end

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64
    end

    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64
        self.save
        self.session_token
    end

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        @password = password
    end

    def is_password?(password)
        password_obj = BCrypt::Password.create(password)
        password_obj.is_password?(password) 
        #isn't recrusive, is calling the is_password? that BCrypt has which is why
        #we create and set the password_obj to an instance of BCrypt Password

    end
end