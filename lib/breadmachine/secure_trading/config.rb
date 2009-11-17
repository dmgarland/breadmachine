module BreadMachine
  module SecureTrading
    
    class Config
      
      attr_accessor :currency, :site_reference, :term_url, :merchant_name, :xpay_client_port
      
      module ClassMethods
        def configuration
          @configuration ||= BreadMachine::SecureTrading::Config.new
        end

        def configure(&block)
          yield configuration
        end
      end
      
      # XPay4 uses port 5000 by default
      def xpay_client_port
        @xpay_client_port.nil? ? 5000 : @xpay_client_port
      end
      
    end
    
  end
end