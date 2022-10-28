require 'test_helper'

class InboxTest < ActiveSupport::TestCase
  test 'valid inbox' do
    user = User.create!(name: 'Dill')
    message1 = Message.create!(content: 'Hey hows it going')
    inbox1 = Inbox.create!(user_id: user.id, message_id: message1.id)

    assert inbox1.valid?
  end

  test 'user' do
    user = User.create!(name: 'Dill')
    message1 = Message.create!(content: 'Hey hows it going')
    message2 = Message.create!(content: 'Open for sales')

    inbox1 = Inbox.create!(user_id: user.id, message_id: message1.id)
    inbox2 = Inbox.create!(user_id: user.id, message_id: message2.id)

    assert inbox1.user.valid?
  end

  test 'messages' do
    user = User.create!(name: 'Dill')
    message1 = Message.create!(content: 'Hey hows it going')
    message2 = Message.create!(content: 'Open for sales')

    inbox1 = Inbox.create!(user_id: user.id, message_id: message1.id)
    inbox2 = Inbox.create!(user_id: user.id, message_id: message2.id)

    assert inbox1.message.valid?
  end
end