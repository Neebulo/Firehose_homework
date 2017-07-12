class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def create
    Author.create(author_params)
    redirect_to root_path
  end

  def show
    @author = Author.find(params[:id])
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    @author.update_attributes(author_params)
    redirect_to root_path
  end

  def destroy
    @author = Author.find(params[:id])
    @author.update_attributes(author_params)
    redirect_to root_path
  end
end
