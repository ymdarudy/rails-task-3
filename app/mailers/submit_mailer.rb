class SubmitMailer < ApplicationMailer
  def submit_mail(submit)
    @submit = submit

    mail to: @submit.user.email, subject: "新規投稿確認メール【写真共有アプリ】"
  end
end
