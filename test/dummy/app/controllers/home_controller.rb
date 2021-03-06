class HomeController < ApplicationController
  def index
    rand(10).times { AdvancedWorker.perform_async }
    SecondWorker.perform_async
    sleep(rand(2.0))
    10.times { User.where(first_name: "X#{rand(100)}").count }
  end

  def about
    sleep(rand(2.0))
    rand(10).times { SimpleWorker.perform_async }
    10.times { User.where(first_name: "X#{rand(100)}").count }
  end

  def contact
    sleep(rand(2.0))
    rand(5).times { SimpleWorker.perform_async }
    rand(3).times { AdvancedWorker.perform_async }
    10.times { User.where(first_name: "X#{rand(100)}").count }
    10.times { User.where(first_name: "Super mega cool" * 20, age: 88, id: [1..100].to_a).count }
  end

  def blog
    rand(3).times { AdvancedWorker.perform_async }
    sleep(rand(2.0))
    2.times { User.where(first_name: "X#{rand(100)}").count }
  end
end
