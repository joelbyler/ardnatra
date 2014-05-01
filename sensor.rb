require 'bundler/setup'
require 'dino'

def pin
  ARGV[0] ||= 'A0'
end

board = Dino::Board.new(Dino::TxRx::Serial.new)
sensor = Dino::Components::Sensor.new(pin: pin, board: board)

sensor.when_data_received do |data|
  puts data
  exit unless ARGV[1]
end

sleep
