# encoding=utf-8
require 'spec_helper'

describe Polytexnic::Core::Pipeline do
  let(:processed_text) { Polytexnic::Core::Pipeline.new(polytex).to_html }
  subject { processed_text }

  describe "code blocks" do
    describe "without syntax highlighting" do
      let(:polytex) do <<-'EOS'
        \begin{code}
        def foo
          "bar"
        end
        \end{code}
        EOS
      end

      it { should resemble 'def foo' }
      it { should resemble '<div class="code">' }
      it { should_not resemble '\begin{code}' }
    end

    describe "with syntax highlighting" do
      let(:polytex) do <<-'EOS'
        %= lang:ruby
        \begin{code}
        def foo
          "bar"
        end
        \end{code}
        EOS
      end

      it { should resemble '<div class="code">' }
      it "should not have repeated code divs" do
        expect(processed_text.scan(/<div class="code">/).length).to eq 1
      end
      it { should resemble '<div class="highlight">' }
      it { should resemble '<pre>' }
    end
  end

  describe "non-ASCII Unicode" do
    let(:polytex) { 'Алексей Разуваев' }
    it { should include(%(<span class="unicode">Алексей</span>)) }
    it { should include(%(<span class="unicode">Разуваев</span>)) }
  end
end