#
# This is a simple example to blink an led
# every half a second
#
require 'bundler/setup'
require 'dino'

# [:on, :off].cycle do |switch|
#   led.send(switch)
#   sleep 0.5
# end

def pin
  ARGV[0] ||= 12
end

def action
  return :off if ARGV[1] == 'off'
  :on
end

board = Dino::Board.new(Dino::TxRx::Serial.new)
led = Dino::Components::Led.new(pin: pin, board: board)
puts action
led.send(action)
