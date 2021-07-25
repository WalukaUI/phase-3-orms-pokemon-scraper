class Pokemon

    attr_accessor :name, :type, :db, :id
   
    def initialize(id:,name:,type:,db:)
     @id=id
     @name=name
     @type=type
     @db=db
    end


def self.save(name,type,db)
    sql = <<-SQL
    INSERT INTO pokemon (name, type) 
    VALUES (?, ?)
    SQL
   db.execute(sql,name,type)
end

def self.findby_db(row)
    id=row[0]
    name=row[1]
    type=row[2]
    Pokemon.new(name,type,id)
   
  end

def self.find(idNum,db)
    sql = <<-SQL
    SELECT * FROM pokemon WHERE id= ?
    SQL
    db.execute(sql,idNum).flatten.map do |row|
      self.findby_db(row)
    end.first
end



end

