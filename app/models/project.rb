class Project < ApplicationRecord

  
  belongs_to :teamleader, class_name: 'User'


  validates :title, presence: true, length: { maximum: 30 }
  validates :description, presence: true ,  length: { minimum: 30 }
  
  #un progetto può avere una o più user_story, una user_story è creata all'interno di ogni singolo progetto
  has_many :user_stories

  #un progetto dispone di una chat con uno o più messaggi, ogni messaggio appartiene ad un unico progetto
  has_many :messages

  #un progetto può avere uno o più partecipanti
  has_many :joins

  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      all
    end
  end

end
