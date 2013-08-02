require 'rubygems'
require 'win32/daemon'
include Win32

class TestDaemon < Daemon
  def service_main
      log 'started'
      while running?
        log 'running'
        sleep 10
      end
  end
  
  def service_stop
    log 'ended'
    exit!
  end
  
  def log(text)
    File.open(File.expand_path("../log.txt", ENV["OCRA_EXECUTABLE"] || __FILE__) , 'a') { |f| f.puts "#{Time.now}: #{text}" }
  end
end

TestDaemon.mainloop unless defined?(Ocra)