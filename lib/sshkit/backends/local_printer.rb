module SSHKit
  module Backend

    class LocalPrinter < Printer

      def initialize(_ = nil, &block)
        @host = Host.new(:local)
        @block = block
      end

    end
  end
end
