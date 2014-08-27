class TodosController < ApplicationController
  
  require 'rubygems'
  require 'json'
  
  # rendering json
  def index
    @todos = Todo.where("user_id = " + current_member.id.to_s)
    @member = Member.find_by(id: current_member.id)
      render :json => {
        :todos => @todos,
        :member => @member
      }
  end

# inserting a todo
  def create
    @todo = Todo.create(todo: request.POST["todo"], done: "0", user_id: current_member.id)
    if @todo.save
      render :json => @todo
    end
  end
  
  # put request responsible for delete one particular todo, editing or deleting all completed ones
  def put
    if request.params()["edit"] == "deleteOne"
      @todo = Todo.find_by(todo: request.params()["todo"], user_id: current_member.id)
      @todo.destroy
    elsif request.params()["edit"] == "one"
      @todo = Todo.find_by(todo: request.params()["todo"], user_id: current_member.id)
      @todo.update(todo: request.params()["newtodo"])
    else
      @todo = Todo.where(done: "1",user_id: current_member.id).destroy_all
    end
    if @todo.save
      render :json => @todo
    end
  end
  
  # marking/unmarking single todo or all todos
  def mark
    if request.params()["mark"] == true && request.params()["all"] == false
      @todo = Todo.find_by(todo: request.params()["todo"], user_id: current_member.id)
      @todo.update(done: "1")
    elsif request.params()["mark"] == false && request.params()["all"] == false
      @todo = Todo.find_by(todo: request.params()["todo"], user_id: current_member.id)
      @todo.update(done: "0")
    elsif request.params()["mark"] == true && request.params()["all"] == true
      @todo = Todo.update_all("done = 1 WHERE user_id = " + current_member.id.to_s)
    else
      request.params()["mark"] == false && request.params()["all"] == true
      @todo = Todo.update_all("done = 0 WHERE user_id = " + current_member.id.to_s)
    end
    if @todo.save
      render :json => @todo
    end
  end
  
  # delete all todos
  def delete
    if Todo.destroy_all(user_id: current_member.id)
      render :json => @todo
    end
  end
  
end
