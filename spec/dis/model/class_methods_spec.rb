# encoding: utf-8

require 'spec_helper'

describe Dis::Model::ClassMethods do
  class WithCustomAttributes < ActiveRecord::Base
    include Dis::Model
    self.dis_attributes = { filename: :uploaded_filename, content_type: :type }
    self.dis_type = 'custom'
  end

  describe '.dis_attributes' do
    subject(:attributes) { model.dis_attributes }

    context 'with no attributes specified' do
      let(:model) { Image }
      it 'should return the default attributes' do
        expect(attributes).to eq(content_hash: :content_hash,
                                 content_length: :content_length,
                                 content_type: :content_type,
                                 filename: :filename)
      end
    end

    context 'with custom attributes' do
      let(:model) { WithCustomAttributes }
      it 'should return the attributes' do
        expect(attributes).to eq(content_hash: :content_hash,
                                 content_length: :content_length,
                                 content_type: :type,
                                 filename: :uploaded_filename)
      end
    end
  end

  describe '.dis_type' do
    subject(:type) { model.dis_type }

    context 'with no attributes specified' do
      let(:model) { Image }
      it 'should return the table name' do
        expect(type).to eq('images')
      end
    end

    context 'with custom attributes' do
      let(:model) { WithCustomAttributes }
      it 'should return the type' do
        expect(type).to eq('custom')
      end
    end
  end
end
