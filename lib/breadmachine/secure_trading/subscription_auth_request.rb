module BreadMachine
  module SecureTrading
    
    class SubscriptionAuthRequest                                                                                           
      
      def initialize(amount, card, customer_info, order_info, unit, period, begin_date, how_many)
        raise ArgumentError, 'Currency mismatch' unless amount.currency == BreadMachine::SecureTrading::configuration.currency
        
        @amount = amount                           
        @card = BreadMachine::SecureTrading::CardXml.new(card)
        @customer_info = BreadMachine::SecureTrading::CustomerInfoAuthXml.new(customer_info)
        @order_info = BreadMachine::SecureTrading::OrderInfoXml.new(order_info)
        @unit = unit
        @period = period
        @begin_date = begin_date
        @how_many = how_many
      end                                                                
      
      def response(xml)
        St3dAuthResponse.new(xml)
      end
      
      def to_xml                                                            
        xml = Builder::XmlMarkup.new(:indent => 2)
        xml.Request("Type" => "SUBSCRIPTIONAUTH") {
          xml.Operation {
            xml.Amount @amount.cents
            xml.Currency BreadMachine::SecureTrading::configuration.currency
            xml.SiteReference BreadMachine::SecureTrading::configuration.site_reference
            xml.Unit @unit
            xml.Period @period
            xml.BeginDate @begin_date
            xml.HowMany @how_many                        
          }                                                    
          xml << @customer_info.to_xml
          xml.PaymentMethod {
            xml << @card.to_xml
          }                      
          xml << @order_info.to_xml
        }
      end
      
    end
    
  end
end
