module Rp
  module ReportsHelper
    def download_file(file_url, report)
      open("#{file_url}") do |file|
        begin
          tempfile = Tempfile.new(report.file_name).tap do |f|
            f.write(file.read)
            f.close
          end
          send_file tempfile.path, filename: report.file_name, type: report.mime_type
        ensure
          tempfile.close
        end
      end
    end
  end
end