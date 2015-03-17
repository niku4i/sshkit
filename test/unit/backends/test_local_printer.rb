require 'helper'

module SSHKit

  module Backend

    class TestLocalPrinter < UnitTest

      def block_to_run
        lambda do |host|
          execute :ls, '-l', '/some/directory'
        end
      end

      def local_printer
        LocalPrinter.new(&block_to_run)
      end

      def test_host
        assert_equal 'localhost', local_printer.host.to_s
      end

      def test_simple_printing
        result = StringIO.new
        SSHKit.capture_output(result) do
          local_printer.run
        end
        result.rewind
        assert_equal "/usr/bin/env ls -l /some/directory\n", result.read
      end

    end

  end

end
