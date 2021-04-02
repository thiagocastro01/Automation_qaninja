describe "POST /equipos" do
  before(:all) do
    payload = { email: "test11@gmail.com", password: "test123" }
    result = Sessions.new.create(payload)
    @user_id = result.parsed_response["_id"]
  end

  context "Create new equipo sucessfully" do
    before(:all) do
      thumbnail = File.open(File.join(Dir.pwd, "/spec/fixtures/images", "sanfona.jpg"))

      payload = { tumbnail: thumbnail,
                  name: "Sanfona",
                  category: "cordas",
                  price: 300 }
      @result = Equipos.new.create(payload, @user_id)
      puts @result
    end

    it "validate status code" do
      expect(@result.code).to eql 200
    end
  end
end
