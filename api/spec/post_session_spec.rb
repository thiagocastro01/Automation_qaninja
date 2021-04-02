describe "POST /sessions" do
  context "login sucessfully" do
    before(:all) do
      payload = { email: "testerjonh@gmail.com", password: "test123" }
      @result = Sessions.new.create(payload)
    end

    it "validate status code" do
      expect(@result.code).to eql 200
    end

    it "validate user id" do
      #Abaixo chamamos o método parsed_response para transformar a variável result em HASH
      expect(@result.parsed_response["_id"].length).to eql 24
    end
  end

  examples = [
    { description: "Login with email unregistered",
      payload: { email: "null@gmail.com", password: "test123" },
      code: 401,
      error: "Unauthorized" },
    {
      description: "Login with wrong password",
      payload: { email: "testerjonh@gmail.com", password: "test12" },
      code: 401,
      error: "Unauthorized",
    },
    {
      description: "Login with blank email field",
      payload: { email: "", password: "test12" },
      code: 412,
      error: "required email",
    },
    {
      description: "Login with blank password field",
      payload: { email: "testerjonh@gmail.com", password: "" },
      code: 412,
      error: "required password",
    },
    {
      description: "Login without email field",
      payload: { password: "test12" },
      code: 412,
      error: "required email",
    },
    {
      description: "Login with blank password field",
      payload: { email: "testerjonh@gmail.com" },
      code: 412,
      error: "required password",
    },

  ]

  examples.each do |ex|
    context "#{ex[:description]}" do
      before(:all) do
        @result = Sessions.new.create(ex[:payload])
      end

      it "validate status code: #{ex[:code]}" do
        expect(@result.code).to eql ex[:code]
      end

      it "validate message error" do
        expect(@result.parsed_response["error"]).to eql ex[:error]
      end
    end
  end
end
