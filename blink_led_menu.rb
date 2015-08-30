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

  if (led.on?)
    led.off
  end

  loop do
    puts "=" * 40
    puts "Press 1 to turn on and 2 to turn off the led. q to quit..."
    input = gets.chomp
    case input
    when '1'
      if (led.off?)
        puts "Turning the led on..."
        led.on
      else
        puts "The led is already on."
      end
    when '2'
      if (led.on?)
        puts "Turning the led off..."
        led.off
      else
        puts "The led is already off."
      end
    when 'q'
      puts "Quitting..."
      break
    end
  end
end
