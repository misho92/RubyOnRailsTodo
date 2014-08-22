class TodosController < ApplicationController
  
  require 'rubygems'
  require 'json'
  
  def index
    render json: Todo.all
    #render json: Todo.first
  end

  def create
    @todo = Todo.create(todo: request.POST["todo"], done: "0", user_id: "1")
    if @todo.save
      render :json => @todo
    end
  end
  
  def put
    if request.params()["edit"] == "deleteOne"
      @todo = Todo.find_by(todo: request.params()["todo"])
      @todo.destroy
    elsif request.params()["edit"] == "one"
      @todo = Todo.find_by(todo: request.params()["todo"])
      @todo.update(todo: request.params()["newtodo"])
    else
      @todo = Todo.where(done: "1").destroy_all
    end
    if @todo.save
      render :json => @todo
    end
  end
  
  def mark
    if request.params()["mark"] == true && request.params()["all"] == false
      @todo = Todo.find_by(todo: request.params()["todo"])
      @todo.update(done: "1")
    elsif request.params()["mark"] == false && request.params()["all"] == false
      @todo = Todo.find_by(todo: request.params()["todo"])
      @todo.update(done: "0")
    elsif request.params()["mark"] == true && request.params()["all"] == true
      @todo = Todo.update_all("done = 1")
    else
      request.params()["mark"] == false && request.params()["all"] == true
      @todo = Todo.update_all("done = 0 WHERE user_id = 1")
    end
    if @todo.save
      render :json => @todo
    end
  end
  
  def delete
    if Todo.destroy_all
      render :json => @todo
    end
  end
  
end
