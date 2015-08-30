require 'artoo'

# Circuit and schematic here: http://arduino.cc/en/Tutorial/Blink
#
connection :arduino, :adaptor => :firmata, :port => '/dev/cu.usbmodemfa131' #linux
#connection :firmata, :adaptor => :firmata, :port => '127.0.0.1:8023'
device :board, :driver => :device_info
device :led, :driver => :led, :pin => 13
work do
  puts "Firmware name: #{board.firmware_name}"
  puts "Firmata version: #{board.version}"

  counter = 1
  every 1.second do
    #led.on? ? led.off : led.on
    led.toggle
    puts "Sono passati #{counter}"
    counter += 1
  end
end
