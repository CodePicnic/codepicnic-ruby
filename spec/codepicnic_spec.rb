require 'codepicnic'

RSpec.describe "CodePicnic", "client" do
  context "with clean state" do
    use_vcr_cassette "CodePicnicToken"
    it "gets a valid token using a client_id and client_secret" do
      CodePicnic.client_id      = "id"
      CodePicnic.client_secret  = "secret"
      expect(CodePicnic.token.size).to eq 64
    end

    it "gets a list of running consoles" do
      results = CodePicnic::Console.all
      expect(results.class).to eq Array
      expect(results.first.class).to eq CodePicnic::Console
    end

    it "saves a new console" do
      console = CodePicnic::Console.new(container_type: "bash", title: "api-spec", container_size: "medium")
      expect(console.save["container_name"]).not_to eq nil
    end

    context "with an existing console" do
      before do
        @console = CodePicnic::Console.new(container_type: "bash", title: "api-spec", container_size: "medium")
        @console.save
      end

      it "executes commands" do
        expect(@console.exec("ls -la").keys.first).to eq "ls -la"
        @response = @console.exec(["ls -la", "echo 'test'"])
        print @response
        expect(@response.values[1]).to eq "test\n"
        expect(@response.keys.first).to eq "ls -la"
        expect(@response.keys[1]).to eq "echo 'test'"
      end
    end


  end
end