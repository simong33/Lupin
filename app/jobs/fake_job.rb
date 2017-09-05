class FakeJob < ApplicationJob
  queue_as :default

  def perform
    puts "HELLO"
    sleep 3
    puts "lol"
  end
end
