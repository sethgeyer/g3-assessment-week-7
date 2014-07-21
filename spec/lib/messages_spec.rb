require 'spec_helper'

describe Messages do

  let(:database_connection) { GschoolDatabaseConnection::DatabaseConnection.establish("test") }
  let(:messages) { Messages.new(database_connection) }

  describe "#add_message_to_dbase" do
    it "adds the submitted message and name to the dbase" do
      messages.add_message_to_dbase("test message", "Seth")
      message = database_connection.sql("SELECT * FROM messages").first
      expect(message["name"]).to eq("Seth")
      expect(message["message"]).to eq("test message")
    end
  end

  describe "#see_all_messages" do
    it "returns a list of all submitted messages" do
      database_connection.sql("INSERT INTO messages (message, name) VALUES ('Message 1', 'Mike1')")
      database_connection.sql("INSERT INTO messages (message, name) VALUES ('Message 2', 'Mike2')")
      all_messages = messages.see_all_messages
      expect(all_messages[0]["message"]).to eq("Message 1")
      expect(all_messages[1]["message"]).to eq("Message 2")
    end
  end



end