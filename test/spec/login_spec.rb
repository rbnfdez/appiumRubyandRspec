

describe 'testing Login' do

  before(:all) {
    @loginpage = LoginPage.new(@driver)
    @loginpage.do_login("frank","papapa22")

  }
    
  context 'Login' do

    it "login is correct" do
      #expect(find.element_by('footer_container'))
      #expect(get_footer).to exist
      @loginpage.wait_for{get_footer}.to exist
    end

    #it "should enter an email address" do
      #@app.passwordInput.send_keys("xxxx")
      #expect(@app.passwordInput.text == "xxxx")
    #end
  end
end
