class Post < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy

  default_scope { order('rank DESC') }


  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true


  #find all the upvotes for a post by passing value: 1 to where. where(value: 1) fetches only the
  #votes with a value of 1. Count is then called on the collection
  def up_votes
    self.votes.where(value: 1).count
  end

  #find all the downvotes for a post by passing value: -1 to where. where(value: -1) fetches only the
  #votes with a value of -1. Count is then called on the collection
  def down_votes
    self.votes.where(value: -1).count
  end

  #This is using ActiveRecords sum method to add the value of all the given post's votes. Passing :value
  #to sum tells it what attribute to sum in the collection
  def points
    self.votes.sum(:value)
  end

  def update_rank
    age_in_days = (created_at - Time.new(1970,1,1))/ 1.day.seconds
    new_rank = points + age_in_days
    update_attribute(:rank, new_rank)
  end
end
