require 'faye'

class Heidi
  class Faye
    def initialize
      print 'faye'
      unless EM.reactor_running?
        Thread.new { EM.run }
      end
      while !EM.reactor_running?
        print '.'
      end

      @client = ::Faye::Client.new('http://localhost:4567/faye')
    end

    def publish(queue, message)
      @client.publish(queue, message)
    end
  end
end