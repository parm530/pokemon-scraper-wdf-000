class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(id, name, type, db)
    @id, @name, @type, @db = id, name, type, db
  end

  def self.save(name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, database_connection)
    pkmn_info = database_connection.execute("SELECT id, name, type FROM pokemon WHERE id = ?", id)
  end

  def alter_hp(new_hp)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, id)
  end

end

