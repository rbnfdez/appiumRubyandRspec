

describe 'testing Login' do

  before(:all) {
    LoginPage.new(@driver).do_login("frank","papapa22")

  }
    
  context 'Login' do

    it "login is correct" do
      #expect(find.element_by('footer_container'))
      #expect(get_footer).to exist
      wait_for(get_footer).to exist
    end

    #it "should enter an email address" do
      #@app.passwordInput.send_keys("papapa22")
      #expect(@app.passwordInput.text == "papapa22")
    #end
  end
end
