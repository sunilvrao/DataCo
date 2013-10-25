class SubscriptionsController < ApplicationController
  def create
    @subscription = Subscription.new(params[:subscription])
    @subscription.save
  end
end
