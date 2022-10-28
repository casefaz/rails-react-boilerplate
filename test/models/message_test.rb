require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  test 'valid message' do
    message = Message.create!(content: 'Hey hows it going')

    assert message.valid?
  end

  test '#inboxes' do
    user = User.create!(name: 'Dill')
    message1 = Message.create!(content: 'Hey hows it going')
    message2 = Message.create!(content: 'Open for sales')

    inbox1 = Inbox.create!(user_id: user.id, message_id: message1.id)
    inbox2 = Inbox.create!(user_id: user.id, message_id: message2.id)

    assert_equal 1, message1.inboxes.size
  end
end