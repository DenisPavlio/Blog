require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'validation' do
    describe '#name_validate' do
      it 'should fail if name blank' do
        answer = described_class.new
        answer.valid?

        expect(answer.errors.full_messages).to include('Name can\'t be blank')
      end

      it 'should fail if name not content a dot' do
        answer = described_class.new(name: 'Terry Terry')
        answer.valid?

        expect(answer.errors.full_messages).to include('Name must contain the dot character "."')
      end

      it 'should fail if name not starts with capital letter' do
        answer = described_class.new(name: 'terry. Terry')
        answer.valid?

        expect(answer.errors.full_messages).to include('Name must be starts with a capital letter')
      end

      it 'should fail if first or second words not contain at least 2 letters' do
        answer = described_class.new(name: 'Jonny D')
        answer.valid?

        expect(answer.errors.full_messages).to include('First and second words must be at least 2 letters')
      end
    end
  end
end
