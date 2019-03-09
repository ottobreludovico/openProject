class User < ActiveRecord::Base

    #criptazione password
    has_secure_password

    validates :username,  presence: true, length: { maximum: 30 }, uniqueness: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
    validates :first_name, presence: true, length: { maximum: 50 }
    validates :last_name, presence: true, length: { maximum: 50 }
    validates :password, presence: true, length: { minimum: 6 }

    #un utente può creare uno o più progetti, un progetto può essere creato solo da un utente
    has_many :projects  #relazione 1 a n
    
    #un utente può scrivere uno o più messaggi, un messaggio può essere scritto solo da un utente
    has_many :messages  #relazione 1 a n

    #un utente può scrivere una o più recensioni, una recensione è scritta da un utente
    has_many :reviews_creator, class_name: 'Review', foreign_key: 'creator_id'

    #un utente può ricevere una o più recensioni, una recensione può essere assegnata ad un solo utente
    has_many :reviews_assigned_to, class_name: 'Review', foreign_key: 'assigned_to_id'

    #un utente può partecipare ad uno o più progetti.
    has_many :joins
    
end
