require 'rails_helper'

RSpec.describe Professor do
  describe '#average_rating_for(my_class)' do
    fixtures :my_classes, :professors, :reviews

    context 'with no classes associated' do
      let(:my_class) { my_classes(:physics) }
      let(:prof) { professors(:no_class) }

      it 'returns nil' do
        expect(prof.average_rating_for(my_class)).to be_nil
      end
    end

    context 'with 1 unreviewed class' do
      let(:prof) { professors(:one_unreviewed_class) }

      it 'returns nil' do
        my_class = prof.my_classes.first

        expect(prof.average_rating_for(my_class)).to be_nil
      end
    end

    context 'with 1 reviewed class that has 1 review' do
      let(:prof) { professors(:one_reviewed_class) }

      it 'returns the rating for that review' do
        my_class = prof.my_classes.first
        review = my_class.reviews.first

        expect(prof.average_rating_for(my_class)).to eq(review.rating)
      end
    end
  end
end
