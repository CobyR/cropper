module Paperclip
  class Cropper < Thumbnail
    def transformation_command
      if crop_command
        cmd = super.join(" ").sub(/ -crop \S+/, '') # remove -crop command
        puts '--------------------------------------------------'
        puts cmd

        if cmd.match(/-resize "600x600"/)
          puts "Skipping because this is the utility image"
          super
        elsif cmd.match(/-resize "700x700"/)
          # handle desired image here
          cmd = crop_command + cmd
          cmd = cmd.sub(/-resize "700x700"/,"-resize \"#{@attachment.instance.desired_w}x#{@attachment.instance.desired_h}\"")
          puts '\t--------------------------------------------------'
          puts "\t#{cmd}"
          cmd.split(" ")
        else
          cmd = crop_command + cmd # Add new crop command
          puts '\t--------------------------------------------------'
          puts "\t#{cmd}"
          cmd.split(" ")
        end
      else
        super
      end
    end

    def crop_command
      target = @attachment.instance
      if target.cropping?
        " -crop '#{target.crop_w}x#{target.crop_h}+#{target.crop_x}+#{target.crop_y}' "
      end
    end
  end
end
