env :PATH, ENV['PATH']
set :output, "#{path}/log/cron_log.log"

every :hour do
  rake 'ts:index'
end

every '30 * * * *' do
  rake 'ts:restart'
end

every :reboot do
  rake 'ts:start'
end
