# path where image magic is installed. You may need to change this.
Paperclip.options[:command_path] = "/usr/local/bin"

Paperclip.interpolates :project_id do |attachment, style|
  attachment.instance.project_id
end
