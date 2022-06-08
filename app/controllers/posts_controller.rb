class PostsController < ApplicationController

  def new
    @post = Post.new
    @post.place_id = params["place_id"]
  end

  def create
    @post = Post.new
    if session["user_id"].nil?
      flash["notice"] = "Please sign in before creating a post."
      redirect_to "/login"
    else
      @post["title"] = params["post"]["title"]
      @post["description"] = params["post"]["description"]
      @post["posted_on"] = params["post"]["posted_on"]
      @post["place_id"] = params["post"]["place_id"]
      @post["user_id"] = session["user_id"]
      @post.save
      redirect_to "/places/#{@post["place_id"]}"
    end
  end

end
