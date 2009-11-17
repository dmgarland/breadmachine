require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BreadMachine::SecureTrading::Config do
  
  it "should set config from block" do
    BreadMachine::SecureTrading.configure do |config|
      config.currency = 'USD'
    end
    BreadMachine::SecureTrading.configuration.currency.should == 'USD'
  end
  
  describe "the xpay_client_port" do
  
    it "should default to 5000" do
      BreadMachine::SecureTrading.configuration.xpay_client_port.should == 5000
    end
    
    it "should be configurable" do
      BreadMachine::SecureTrading.configure do |config|
        config.xpay_client_port = 5001
      end
      BreadMachine::SecureTrading.configuration.xpay_client_port.should == 5001
    end
  end
  
end