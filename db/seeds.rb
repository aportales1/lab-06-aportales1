# db/seeds.rb

users = []
10.times do |i|
  users << User.create!(
    email: "user#{i + 1}@example.com",
    first_name: "First#{i + 1}",
    last_name: "Last#{i + 1}"
  )
end

chats = []
5.times do
  sender = users.sample
  receiver = (users - [sender]).sample
  chats << Chat.create!(
    sender_id: sender.id,
    receiver_id: receiver.id
  )
end

20.times do
  chat = chats.sample
  sender = users.sample
  Message.create!(
    chat_id: chat.id,
    user_id: sender.id,
    body: "Hello from #{sender.first_name}!"
  )
end