class UserMailer < ActionMailer::Base
  default from: "lcmorav22@gmail.com"

  def message_new_task(user,task)
    email = user.email
    @task = task 
    mail(to: email, subject: "Nueva Tarea: "+@task.description)
  end
end
