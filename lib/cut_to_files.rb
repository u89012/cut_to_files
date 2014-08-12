require 'fileutils'

class String
	def cut_to_files
		f = $stdout
		self.lines.map{|l|
			if l =~ /^--(.*)\/(.*)\s*$/
				f.close if f != $stdout
				FileUtils.mkdir_p $1
				f = File.open($1 + '/' + $2, 'w')
				next
			end
			f.puts l
		}
		f.close
	end
end
