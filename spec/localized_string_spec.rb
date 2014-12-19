# encoding: utf-8
$LOAD_PATH << 'lib/formtastic'
require 'localized_string'
require 'active_support/core_ext/object/blank'

describe Formtastic::LocalizedString do
  let(:model) do
    clazz = Class.new
    clazz.new
  end

  subject do
    class Builder
      include Formtastic::LocalizedString

      attr_accessor :object, :string
    end
    Builder.new
  end

  context "a form object with ActiveModel::Naming" do
    before do
      allow(model.class).to receive(:model_name).and_return(double(i18n_key: 'foo'))
    end

    it "uses i18n_key" do
      subject.object = model
      expect(subject.model_name).to eq('foo')
    end
  end

  context "a form object of an ordinary class" do
    before do
      allow(model.class).to receive(:name).and_return("HappyClass")
    end

    it "uses i18n_key" do
      subject.object = model
      expect(subject.model_name).to eq('HappyClass')
    end
  end
end
