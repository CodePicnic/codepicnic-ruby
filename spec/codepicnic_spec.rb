require 'codepicnic'

RSpec.describe "CodePicnic", ".token" do
  context "with no existing token" do
    use_vcr_cassette "CodePicnicToken"
    it "gets a valid token using a client_id and client_secret" do
      CodePicnic.client_id      = "SOME_ID"
      CodePicnic.client_secret  = "SOMETHING_SECRET"
      expect(CodePicnic.token.size).to eq 64
    end

    it "gets a list of running consoles" do
      results = CodePicnic::Console.all
      expect(results.class).to eq Array
      expect(results.first.class).to eq CodePicnic::Console
    end

    it "saves a new console" do
      console = CodePicnic::Console.new(container_type: "bash", container_size: "medium", hostname: "api-spec")
      console.save
      expect(CodePicnic::Console.all.last.url).to eq console.url
    end

    context "with an existing console" do
      before do
        @console = CodePicnic::Console.new(container_type: "bash", container_size: "medium", hostname: "api-spec")
        @console.save
      end

      it "executes commands" do
        expect(@console.exec("ls -la")).to eq "---"
      end
    end


  end
end