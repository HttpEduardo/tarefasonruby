class User < ApplicationRecord
  has_many :assigned_tasks, class_name: 'Task', foreign_key: 'assigned_to_id'
  has_many :created_tasks, class_name: 'Task', foreign_key: 'assigned_by_id'
end

class UsersController < ApplicationController
  def tasks
    @user = User.find(params[:id])
    @tasks = @user.tasks
  end
end


class Task < ApplicationRecord
  belongs_to :assigned_to, class_name: 'User'
  belongs_to :assigned_by, class_name: 'User'
end

# no controller TasksController

<%= form_with(model: task, local: true) do |form| %>
  <%= form.label :title %>
  <%= form.text_field :title %>

  <%= form.label :description %>
  <%= form.text_area :description %>

  <%= form.label :due_date %>
  <%= form.date_select :due_date %>

  <%= form.label :completed %>
  <%= form.check_box :completed %>

  <%= form.label :user_id %>
  <%= form.select :user_id, User.all.collect {|u| [u.name, u.id]} %>

  <%= form.submit %>
<% end %>

<h1>Tarefas atribuídas a <%= @user.name %></h1>

<ul>
  <% @tasks.each do |task| %>
    <li><%= task.title %></li>
  <% end %>
</ul>


def new
  @task = Task.new
  @users = User.all
end

def create
  @task = Task.new(task_params)
  if @task.save
    flash[:success] = 'Tarefa
