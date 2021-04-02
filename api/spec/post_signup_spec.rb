describe "POST /signup" do
  context "Signup sucessfully" do
    before(:all) do
      payload = { name: "tester Jonh", email: "testerjonh@gmail.com", password: "test123" }
      MongoDB.new.remove_user(payload[:email])
      @result = Signup.new.create(payload)
    end

    it "validate status code" do
      expect(@result.code).to eql 200
    end

    it "validate user id" do
      #Abaixo chamamos o método parsed_response para transformar a variável result em HASH
      expect(@result.parsed_response["_id"].length).to eql 24
    end
  end

  context "Duplicate user" do
    before(:all) do
      payload = { name: "tester clovis", email: "testerclovis@gmail.com", password: "test123" }
      MongoDB.new.remove_user(payload[:email])
      Signup.new.create(payload)
      @result = Signup.new.create(payload)
    end
    it "validate status code" do
      expect(@result.code).to eql 409
    end

    it "validate message error" do
      #Abaixo chamamos o método parsed_response para transformar a variável result em HASH
      expect(@result.parsed_response["error"]).to eql "Email already exists :("
    end
  end

  examples = [
    { description: "Login without name field",
      payload: { email: "testerhugo@gmail.com", password: "test123" },
      error: "required name" },
    {
      description: "Login without email field",
      payload: { name: "tester jonh", password: "test12" },
      error: "required email",
    },
    {
      description: "Login without password field",
      payload: { name: "thiago", email: "testeer@gmail.com" },
      error: "required password",
    },
    {
      description: "Login with blank password field",
      payload: { name: "", email: "testerjonh@gmail.com", password: "test" },
      error: "required name",
    },
    {
      description: "Login with wrong email",
      payload: { name: "Tester uila", email: "testerjonh$gil.com", password: "test" },
      error: "wrong email",
    },
    {
      description: "Login without email field",
      payload: { name: "tester jonh", email: "", password: "test" },
      error: "required email",
    },
    {
      description: "Login with blank password field",
      payload: { name: "tester jonh", email: "test@gmail.com", password: "" },
      error: "required password",
    },

  ]

  examples.each do |ex|
    context "#{ex[:description]}" do
      before(:all) do
        @result = Signup.new.create(ex[:payload])
      end

      it "validate message error" do
        expect(@result.parsed_response["error"]).to eql ex[:error]
      end
    end
  end
end
