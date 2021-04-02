require "mongo"

Mongo::Logger.logger = Logger.new("./spec/logs/mongo.log")

class MongoDB
  attr_accessor :users, :equipos

  def initialize
    #A variável client conecta com o bd e conseguimos passar como parâmetro o nome da coleção requerida
    client = Mongo::Client.new("mongodb://rocklov-db:27017/rocklov")
    @users = client[:users]
    @ads = client[:equipos]
  end

  def remove_user(email)
    @users.delete_many({ email: email })
  end

  def get_user(email)
    user = @users.find({ email: email }).first
    return user[:_id]
  end

  def remove_ad(name, email)
    user_id = get_user(email)
    @ads.delete_many({ name: name, user: user_id })
  end
end
