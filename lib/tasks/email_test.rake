# Borrowed aggressively from http://devblog.orgsync.com/designers-workflow-for-html-emails-in-a-rails-app/

task :send_all => :environment do |acc|

    # Establish what user we want to send the test to
    # print "\n What is your account id? "
    # acc_num = $stdin.gets.to_i
    account = User.find(1)

    # This is a good spot to do a little input-error checking. I don't trust myself (or my coworkers)
    # so I ran a check to make sure the account here exists as an administrator in our system
    # this prevents me from sending our suite of test emails to a random user.

    # Based on the account, it's also a good idea to establish any other variables that might be used multiple
    # times by your mailers so you're not establishing them multiple times below.

    # send a 
    DailyDigest.send_reminder_email(account).deliver
    print "Reminder email set"

end
