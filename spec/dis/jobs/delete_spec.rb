# encoding: utf-8

require 'spec_helper'

describe Dis::Jobs::Delete do
  let(:type) { 'test_files' }
  let(:hash) { '8843d7f92416211de9ebb963ff4ce28125932878' }
  let(:job)  { Dis::Jobs::Delete.new }

  describe '#perform' do
    it 'should perform the job' do
      expect(Dis::Storage).to receive(:delayed_delete).with(type, hash)
      job.perform(type, hash)
    end
  end
end
