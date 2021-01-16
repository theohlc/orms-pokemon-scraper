class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize(row)
        @id = row[:id]
        @name = row[:name]
        @type = row[:type]
        @db = row[:db]
    end

    def self.save(name, type, db)
        db.execute('INSERT INTO pokemon (name, type) VALUES (?,?)', name, type)
    end

    def self.find(id, db)
        row = db.execute('SELECT name, type FROM pokemon WHERE id = ?', id)[0]
        row_hash = {
            :id => id,
            :name => row[0],
            :type => row[1],
            :db => db
        }
        
        new(row_hash)
    end

end
