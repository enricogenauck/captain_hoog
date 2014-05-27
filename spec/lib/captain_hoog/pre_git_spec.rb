require 'spec_helper'

describe CaptainHoog::PreGit do

  describe "class methods" do

    subject{ CaptainHoog::PreGit }

    it "provides #run" do
      expect(subject).to respond_to(:run)
    end

    it "provides #project_dir getter" do
      expect(subject).to respond_to(:project_dir)
    end

    it "provides #project_dir setter" do
      expect(subject).to respond_to(:project_dir=)
    end

    it "provides #plugins_dir getter" do
      expect(subject).to respond_to(:plugins_dir)
    end

    it "provides #plugins_dir setter" do
      expect(subject).to respond_to(:plugins_dir=)
    end

    it "provides #configure" do
      expect(subject).to respond_to(:configure)
    end

    describe "#configure" do
      let(:plugins_path) do
        File.join(File.dirname(__FILE__),
                  "..",
                  "..",
                  "fixtures",
                  "test_plugins")
      end

      before do
        subject.configure do |config|
          config.headline_on_success = "Success!"
          config.headline_on_failure = "Failure!"
          config.project_dir = File.dirname(__FILE__)
          config.plugins_dir = plugins_path
          config.suppress_headline = true
        end
      end

      it "let you define the success headline message" do
        expect(CaptainHoog::PreGit.headline_on_success).to eq "Success!"
      end

      it "let you define the failure headline message" do
        expect(CaptainHoog::PreGit.headline_on_failure).to eq "Failure!"
      end

      it "let you define the project_dir" do
        expect(CaptainHoog::PreGit.project_dir).to eq File.dirname(__FILE__)
      end

      it "let you define the plugins dir" do
        expect(CaptainHoog::PreGit.plugins_dir).to eq plugins_path
      end

    end

    describe "#run" do

      it "returns an instance of CaptainHoog::PreGit" do
        expect(CaptainHoog::PreGit.run).to be_instance_of(CaptainHoog::PreGit)
      end

    end

  end

  describe "instance methods" do

    it "provides #plugins_eval" do
      expect(subject).to respond_to(:plugins_eval)
    end

  end

end
