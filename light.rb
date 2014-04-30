require 'bundler/setup'
require 'dino'

def pin
  ARGV[0] ||= 12
end

def action
  return :off if ARGV[1] == 'off'
  :on
end

board = Dino::Board.new(Dino::TxRx::Serial.new)
led = Dino::Components::Led.new(pin: pin, board: board)
led.send(action)
