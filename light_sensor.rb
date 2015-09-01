require 'artoo'

connection :arduino, :adaptor => :firmata, :port => '/dev/cu.usbmodemfa131' #cu on mac tty on linux
device :board, :driver => :device_info
device :sensor, driver: :analog_sensor, pin: 0, interval: 0.25, upper: 1000, lower: 200
device :led, driver: :led, pin: 12

work do
  puts "Firmware name: #{board.firmware_name}"
  puts "Firmata version: #{board.version}"

  if led.on?
    led.off
  end
  every 1.second do
    sensor_value = sensor.analog_read(0)
    # puts "Sensor val => #{sensor_value}"
    if sensor_value > 500
      led.off
    else
      led.on
    end
  end
end
