require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'valid user' do
    user = User.new(name: 'Dill')
    assert user.valid?
  end

  test '#inboxes' do
    user = User.create!(name: 'Dill')
    message1 = Message.create!(content: 'Hey hows it going')
    message2 = Message.create!(content: 'Open for sales')

    inbox1 = Inbox.create!(user_id: user.id, message_id: message1.id)
    inbox2 = Inbox.create!(user_id: user.id, message_id: message2.id)
    # binding.pry
    assert_equal 2, user.inboxes.size
  end

end