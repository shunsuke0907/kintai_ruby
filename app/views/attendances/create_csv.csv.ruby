require 'csv'
        
CSV.generate do |csv|
  csv_header = ['日付', '曜日', '出社', '退社', '在社時間', '備考']
  csv << csv_header
  
  @attendances.each do |at|
    started_at = "#{at.started_at.to_s(:hour)}:#{at.started_at.to_s(:min)}" if at.started_at.present?
    finished_at = "#{at.finished_at.to_s(:hour)}:#{at.finished_at.to_s(:min)}" if at.finished_at.present?
    working_times = working_times(at.started_at, at.finished_at) if at.started_at.present? && at.finished_at.present?
    
    csv_body = [
      at.worked_on.to_s(:date),
      %w{日 月 火 水 木 金 土}[at.worked_on.wday],
      started_at,
      finished_at,
      working_times,
      at.note
    ]
    csv << csv_body
  end
end