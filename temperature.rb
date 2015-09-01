require 'artoo'

connection :arduino, :adaptor => :firmata, :port => '/dev/cu.usbmodemfa131' #cu on mac tty on linux
device :board, :driver => :device_info
device :sensor, driver: :analog_sensor, pin: 0, upper: 1000, lower: 200;
work do
  puts "Firmware name: #{board.firmware_name}"
  puts "Firmata version: #{board.version}"

  every 1.second do
   #value = sensor.analog_read(0)
   #voltage = value * 5000 / 1024
   #temperature = (voltage - 500) / 10
   #puts "Sensor value => #{value}"
   #puts "Voltage val => #{voltage} mV"
   #puts "Temperature val => #{temperature}"
   puts "Sensor val => #{sensor.analog_read(0)}"
  end
end
