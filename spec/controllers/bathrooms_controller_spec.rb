require 'spec_helper'

describe BathroomsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end

    it "should assign all bathrooms" do
      br0 = Bathroom.new(name:"guys")
      br1 = Bathroom.new(name:"womens")
      Bathroom.stubs(:order).with(:position => :asc).returns([br0,br1])

      get 'index'
      assigns[:bathrooms].should == [br0,br1]
    end
  end

  describe 'admin GET /bathrooms/admin(.:format)' do
   it 'should assign all bathrooms' do
      br0 = Bathroom.new(name:"guys")
      br1 = Bathroom.new(name:"womens")
      Bathroom.stubs(:order).with(:position => :asc).returns([br0,br1])

      get :admin
      assigns[:bathrooms].should == [br0,br1]
   end
  end

  describe 'update PATCH  /bathrooms/:id(.:format)' do
    before :each do
      @bathroom = Bathroom.new(name:"Guys", position:1, gpio_pin:17, occupied:true, leds_count:1)
      @params = {id: 99, bathroom: {gpio_pin:22, position:3, occupied:false, leds_count:2}}
      Bathroom.expects(:find).with('99').returns(@bathroom)
    end

    it 'should redirect to admin page' do
      @bathroom.expects(:update_attributes).returns(true)
      patch :update, @params
      response.should redirect_to admin_bathrooms_path
    end

    it 'should update segment order' do
      @bathroom.expects(:update_attributes).with({'gpio_pin' => '22',
                                                  'occupied' => false,
                                                  'position' => '3',
                                                  'leds_count' => '2'}).returns(true)
      patch :update, @params
    end

    it 'should flash error if save is unsuccessful' do
      Bathroom.any_instance.stubs(:update_attributes).returns(false)
      patch :update, @params
      flash[:error].should == "Error updating Guys bathroom"
    end
  end

end
