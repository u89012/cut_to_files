require 'pathname'

class String
	def cut_to_files
		buf = Hash.new { |hash, key| hash[key] =  []}

		cur = nil
		self.lines.map{|l|
			l.strip!

			if l =~ /^(\*|\+).+$/
				cur = l
				next
			end

			if cur
				buf[cur] << l
			end
		}

		# pp buf

		buf.map{|k,v|
			p = Pathname.new k[1..-1]
			p.dirname.mkpath

			if k[0] == "*"
				open(p.to_s, "w"){|f| f << v.join($/)}
			elsif k[0] == "+"
				open(p.to_s, "a"){|f| f << v.join($/)}
			end
		}
	end
end
