# Reset data
User.destroy_all
Chat.destroy_all
Message.destroy_all

# Create 10 users
10.times do |i|
  User.create!(
    email: "user#{i + 1}@example.com",
    first_name: "First#{i + 1}",
    last_name: "Last#{i + 1}"
  )
end

user_ids = User.pluck(:id)

# Create 10 chats
10.times do
  sender_id, receiver_id = user_ids.sample(2)
  Chat.create!(
    sender_id: sender_id,
    receiver_id: receiver_id
  )
end

chat_ids = Chat.pluck(:id)

# Create 10 messages
10.times do
  Message.create!(
    chat_id: chat_ids.sample,
    user_id: user_ids.sample,
    body: "This is a test message #{rand(100..999)}"
  )
end
