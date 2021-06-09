class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
  end

  def destroy
  end

  def following
  end

  def follower
  end
end
