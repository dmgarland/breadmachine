module BreadMachine
  module SecureTrading
    
    class OrderInfoXml
      
      def initialize(order_info)
        @order_info = order_info
      end
      
      def to_xml
        xml = Builder::XmlMarkup.new(:indent => 2)
        # TODO: stick the order information in CDATA so that we can have fancy
        # characters
        xml.Order {
          xml.OrderReference @order_info.order_reference
          xml.OrderInformation @order_info.order_information
        }
      end
      
    end
    
  end
end