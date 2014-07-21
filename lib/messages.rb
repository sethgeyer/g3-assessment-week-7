class Messages
  def initialize(db_connection)
    @database_connection = db_connection
  end

  def add_message_to_dbase(message, name)
    @database_connection.sql("INSERT INTO messages (message, name) VALUES ('#{message}', '#{name}')")
  end

  def see_all_messages
    @database_connection.sql("SELECT * from messages")
  end
end