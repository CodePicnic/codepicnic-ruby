require 'codepicnic'

RSpec.describe "CodePicnic", "client" do
  context "with clean state" do
    use_vcr_cassette "CodePicnicToken"
    it "gets a valid token using a client_id and client_secret" do
      CodePicnic.client_id      = "db43170afee829f2d6823530d4c2fce22d103c2a16fc6241d32e9f37f5e32af9"
      CodePicnic.client_secret  = "dc3ca309a2d5da9578d3b8092590ba499c8c9771846b1dbfff04cb265545501c"
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
      end
    end


  end
end