# sql_runner.rb

require('pg')


class SqlRunner
  # class method only
  def self.run(sql, values = [])
    begin
      db = PG.connect({dbname: 'ccc', host: 'localhost'})
      db.prepare('query', sql)
      result = db.exec_prepared('query', values)
    ensure
      db.close() if db != nil
    end
    return result
  end
end







# sql_runner.rb
